// importing modules
const express = require("express");
const http = require("http");
const mongoose = require("mongoose");

// Initializing express and storing in app
const app = express();

/* Port on which our server will run
   we are assuming it to run on 3000 but 
   the port given by the hosting service will
   be used 
*/
const port = process.env.port || 3000;

// server
var server = http.createServer(app);

// Room
const Room = require("./models/room");
const { emit } = require("process");

// socket io

// // Longer Way
// var socketio = require("socket.io");
// var io = socketio(server);

//Shorter Way
var io = require("socket.io")(server);

// Middle Ware
// Client -> MiddleWare -> Server
app.use(express.json); // Will convert all the comming data to json

const DB =
  "mongodb+srv://singh3abhi:OV77DbQY0XdlIWXr@cluster0.ig03ppz.mongodb.net/?retryWrites=true&w=majority";

// Setting up the socket io
// If there is any connection, it will be printed
io.on("connection", (socket) => {
  console.log("connected");

  // Object Destructuring (Map is a object in js)
  // {
  //   'nickname': 'rivaan',
  //   'standard':  'high',
  // }

  // respective value can be accessed using
  // {nickname}
  // {standard}

  socket.on("createRoom", async ({ nickname }) => {
    console.log(nickname);

    try {
      // Room is created
      let room = new Room();

      // Player created
      let player = {
        socketID: socket.id,
        // nickname: nickname, is same as nickname,
        nickname,
        playerType: "X",
      };

      // adding player schema in room
      room.players.push(player);

      // player who's turn is right now will be stored
      room.turn = player;

      // Data is saved in mongoDB
      room = await room.save();
      console.log(room);
      // it will return us room with some properties like room id
      // This room id is created by mongoDB itself, it will be unique
      // that is why it will be used to assign room to the users

      const roomId = room._id.toString();

      // We will make sure our socket joins this roomID
      // otherwise requests will go to both the games , we want that
      // each game's request should go to their players screen only

      // game 1 -> A & B => Socket 1
      // game 2 -> C & D => Socket 2
      socket.join(roomId);

      // server -> room
      // Tell Our client that room has been created
      // go to the next page
      // io -> send data to everyone
      // socket -> sending data to yourself
      io.to(roomId).emit("createRoomSuccess", room);
    } catch (e) {
      console.log(e);
    }

    // player is taken to the next screen
  });

  socket.on("joinRoom", async ({ nickname, roomId }) => {
    try {
      // roomId given by mongoDB has a particular format (regex id)
      // /^[0-9a-fA-F]{24}$/ -> regex id used by mongoDB for roomID
      // .match will match regexid of our roomId and mongoDB's roomId
      // So that no wrond roomId is enetered
      if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
        socket.emit("errorOccurred", "Please enter a valid room ID.");
        return;
      }

      // roomId is correct
      let room = await Room.findById(roomId);

      // If room is joinable
      if (room.isJoin) {
        let player = {
          nickname,
          socketID: socket.id,
          playerType: "O",
        };

        socket.join(roomId);

        room.players.push(player);
        room.isJoin = false;
        room = await room.save();

        io.to(roomId).emit("joinRoomSuccess", room);
        io.to(roomId).emit("updatePlayers", room.players);
        io.to(roomId).emit("updateRoom", room);
      } else {
        socket.emit(
          "errorOccurred",
          "The game is in progress, try again later."
        );
      }
    } catch (e) {
      console.log(e);
    }
  });

  socket.on("tap", async ({ index, roomId }) => {
    try {
      //Found the room by id
      let room = await Room.findById(roomId);

      // Store the choice of the user so that we can
      // send it to the client as we gonna change the turn
      let choice = room.turn.playerType; // X or 0

      //Changing the turn and turnIndex
      if (room.turnIndex == 0) {
        room.turn = room.players[1];
        room.turnIndex = 1;
      } else {
        room.turn = room.players[0];
        room.turnIndex = 0;
      }

      room = await room.save();

      io.to(roomId).emit("tapped", {
        index,
        choice,
        room,
      });
    } catch (e) {
      console.log(e);
    }
  });

  socket.on("winner", async ({ winnerSocketId, roomId }) => {
    try {
      let room = await Room.findById(roomId);
      let player = room.players.find(
        (player) => player.socketID == winnerSocketId
      );
      player.points += 1;
      room = await room.save();

      console.log(player.points);
      console.log(room.maxRounds);
      console.log(player.points >= room.maxRounds);

      if (player.points >= room.maxRounds) {
        io.to(roomId).emit("endGame", player);
      } else {
        io.to(roomId).emit("pointIncrease", player);
      }
    } catch (e) {
      console.log(e);
    }
  });
});

// Promise in js is future in dart (.then is used to acceess)
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection successful!");
  })
  .catch((e) => {
    console.log(e);
  });

// backtick -> ` ` is used for string interpolation part
server.listen(port, "0.0.0.0", () => {
  console.log(`Server started and running on port ${port}`);

  //Old way of String interpolation
  // console.log("Server started and running on port" + port);
});
