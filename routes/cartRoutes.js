const express = require("express");
const router = express.Router();
const cartController = require("../controllers/cartController");

// Route to get user's cart
router.get("/", cartController.getCart);

// Route to add an item to the cart
router.post("/", cartController.addItemToCart);

// Route to remove an item from the cart
router.delete("/:id", cartController.removeItemFromCart);

module.exports = router;
