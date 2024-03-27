const express = require("express");
const router = express.Router();
const cartController = require("../controllers/cartController");

// Add item to cart route
router.post("/", cartController.addItemToCart);

// Get cart items route
router.get("/", cartController.getCartItems);

// Update cart item route
router.put("/:id", cartController.updateCartItem);

// Delete cart item route
router.delete("/:id", cartController.deleteCartItem);

module.exports = router;
