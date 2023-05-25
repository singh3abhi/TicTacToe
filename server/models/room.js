const mongoose = require("mongoose");
const playerSchema = require("./players");

//Create a scheme
//scheme is skeleton of data model we are going to store

const roomSchema = new mongoose.Schema({
  // These will be the properties of our roomSchema

  // Occupancy
  // How long is the room
  // How many players are going to fit in this rooM
  occupancy: {
    type: Number,
    default: 2,
  },

  // Number of rounds in the game
  maxRounds: {
    type: Number,
    default: 3,
  },

  // CurrentRound will be changed everytime that is why
  // required is used because this will be necessary

  currentRound: {
    required: true,
    type: Number,
    default: 1,
    // When we are not passing the currentRound value means that
    // we have just started the game (first round)
  },

  // We can do this in two ways either like this
  // players: [{
  //   player: {

  //   }
  // }],

  // Or create another schema for players

  // Problem with this is that in javascript we do not get any
  // automatic option of importing playerSchema because playerSchema
  // is actually a private field over there
  // That is why module.exports = playerSchema; in players.js
  // is used to export it to all the other classes and files

  players: [playerSchema],

  // This will check if room is joinable or not i.e we do not want
  // third person to join the room while game is running
  isJoin: {
    type: Boolean,
    default: true,
  },
  //Other thing we could have done was check occupancy = players.length but above one is better

  // Who's trun is going on, who is playing right now
  turn: playerSchema,

  // Keeping track of which user's turn it is using index
  turnIndex: {
    type: Number,
    default: 0,
  },
});

// Convert roomSchema to roomModel
const roomModel = mongoose.model("Room", roomSchema);

// roomModel Exported
module.exports = roomModel;
