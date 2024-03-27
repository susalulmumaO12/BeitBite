// models/cooker.js

const mongoose = require("mongoose");

const cookerSchema = new mongoose.Schema({
  username: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  profile: {
    // You can define fields specific to the profile of the cooker here
  },
  // Add more fields specific to the cooker if needed
});

const Cooker = mongoose.model("Cooker", cookerSchema);

module.exports = Cooker;
