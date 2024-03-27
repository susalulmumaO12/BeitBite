const mongoose = require("mongoose");

const orderSchema = new mongoose.Schema({
  user: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "User",
    required: true,
  },
  // Add more fields related to order
});

const Order = mongoose.model("Order", orderSchema);

module.exports = Order;
