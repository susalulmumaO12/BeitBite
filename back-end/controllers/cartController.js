const Cart = require("../models/cart");

// Controller to get user's cart
exports.getCart = async (req, res) => {
  try {
    const cart = await Cart.findOne({ user: req.user.id }).populate(
      "items.dish"
    );
    if (!cart) {
      return res.status(404).json({ message: "Cart not found" });
    }
    res.status(200).json({ cart });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to add an item to the cart
exports.addItemToCart = async (req, res) => {
  try {
    const { dishId, quantity } = req.body;
    const userId = req.user.id;

    let cart = await Cart.findOne({ user: userId });

    if (!cart) {
      // If the user doesn't have a cart, create a new one
      cart = new Cart({
        user: userId,
        items: [{ dish: dishId, quantity: quantity }],
      });
    } else {
      // If the user already has a cart, check if the dish is already in the cart
      const existingItemIndex = cart.items.findIndex((item) =>
        item.dish.equals(dishId)
      );
      if (existingItemIndex !== -1) {
        // If the dish is already in the cart, update its quantity
        cart.items[existingItemIndex].quantity += quantity;
      } else {
        // If the dish is not in the cart, add it as a new item
        cart.items.push({ dish: dishId, quantity: quantity });
      }
    }

    // Save the updated cart
    await cart.save();
    res.status(200).json({ message: "Item added to cart successfully", cart });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to remove an item from the cart
exports.removeItemFromCart = async (req, res) => {
  try {
    const dishId = req.params.id;
    const userId = req.user.id;

    // Find user's cart and update it to remove the specified dish
    const cart = await Cart.findOneAndUpdate(
      { user: userId },
      { $pull: { items: { dish: dishId } } },
      { new: true }
    );

    if (!cart) {
      return res.status(404).json({ message: "Cart not found" });
    }

    res
      .status(200)
      .json({ message: "Item removed from cart successfully", cart });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
