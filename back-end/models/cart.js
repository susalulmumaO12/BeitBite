const mongoose = require("mongoose");

const cartSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  // Add more fields related to cart items
});

const Cart = mongoose.model("Cart", cartSchema);

module.exports = Cart;
