const express = require("express");
const router = express.Router();
const orderController = require("../controllers/orderController");

// Create a new order route
router.post("/", orderController.createOrder);

// Get all orders route
router.get("/", orderController.getAllOrders);

// Get order by ID route
router.get("/:id", orderController.getOrderById);

// Update order by ID route
router.put("/:id", orderController.updateOrderById);

// Delete order by ID route
router.delete("/:id", orderController.deleteOrderById);

module.exports = router;
