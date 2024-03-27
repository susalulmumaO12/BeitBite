const Order = require("../models/order");

// Controller to create a new order
exports.createOrder = async (req, res) => {
  try {
    // Create a new order based on request body
    const newOrder = new Order(req.body);
    await newOrder.save();
    res
      .status(201)
      .json({ message: "Order created successfully", order: newOrder });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to get all orders
exports.getAllOrders = async (req, res) => {
  try {
    // Fetch all orders from the database
    const orders = await Order.find();
    res.status(200).json({ orders });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to get order by ID
exports.getOrderById = async (req, res) => {
  try {
    // Fetch order by ID from the database
    const order = await Order.findById(req.params.id);
    if (!order) {
      return res.status(404).json({ message: "Order not found" });
    }
    res.status(200).json({ order });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to update order by ID
exports.updateOrderById = async (req, res) => {
  try {
    // Update order by ID in the database
    const updatedOrder = await Order.findByIdAndUpdate(
      req.params.id,
      req.body,
      { new: true }
    );
    if (!updatedOrder) {
      return res.status(404).json({ message: "Order not found" });
    }
    res
      .status(200)
      .json({ message: "Order updated successfully", order: updatedOrder });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to delete order by ID
exports.deleteOrderById = async (req, res) => {
  try {
    // Delete order by ID from the database
    const deletedOrder = await Order.findByIdAndDelete(req.params.id);
    if (!deletedOrder) {
      return res.status(404).json({ message: "Order not found" });
    }
    res.status(200).json({ message: "Order deleted successfully" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
