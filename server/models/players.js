const mongoose = require("mongoose");

// Player schema for player model in our room model
const playerSchema = new mongoose.Schema({
  //Properties of playerSchema

  // nickname of player
  nickname: {
    type: String,
    trim: true,
  },

  // Unique socketID of each room
  socketID: {
    type: String,
  },

  // Points of the game
  points: {
    type: Number,
    default: 0,
  },

  // Whether player is using O or X
  playerType: {
    required: true,
    type: String,
  },
});

// To export this playerSchema in js we do
module.exports = playerSchema;
// With this our playerSchema is accessible to other files and classes
