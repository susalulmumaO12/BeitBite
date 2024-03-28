const mongoose = require("mongoose");
const User = require("./user");
const Dish = require("./dish");

const cartSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  items: [
    {
      dish: {
        type: mongoose.Schema.Types.ObjectId,
        ref: "Dish",
        required: true,
      },
      quantity: {
        type: Number,
        default: 1,
      },
    },
  ],
});

const Cart = mongoose.model("Cart", cartSchema);

module.exports = Cart;
