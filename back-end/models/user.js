// models/user.js

const mongoose = require("mongoose");

const profileSchema = new mongoose.Schema({
  name: { type: String },
  address: { type: String },
  // Add more fields as needed
});

const userSchema = new mongoose.Schema({
  username: { type: String, required: true, unique: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true },
  profile: profileSchema, // Embedded profile subdocument
  cart: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Cart",
    },
  ],
  orders: [
    {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Order",
    },
  ],
});

const User = mongoose.model("User", userSchema);

module.exports = User;
