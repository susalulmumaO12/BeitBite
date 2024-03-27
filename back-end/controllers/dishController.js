const Dish = require("../models/dish");

// Controller to create a new dish by cooker
exports.createDish = async (req, res) => {
  try {
    const newDish = new Dish(req.body);
    // You may want to associate the dish with the cooker who created it
    // For example: newDish.cooker = req.user.id; (assuming you have authentication middleware)
    await newDish.save();
    res
      .status(201)
      .json({ message: "Dish created successfully", dish: newDish });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to get all dishes
exports.getAllDishes = async (req, res) => {
  try {
    const dishes = await Dish.find();
    res.status(200).json({ dishes });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to get dish by ID
exports.getDishById = async (req, res) => {
  try {
    const dish = await Dish.findById(req.params.id);
    if (!dish) {
      return res.status(404).json({ message: "Dish not found" });
    }
    res.status(200).json({ dish });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to update dish by ID
exports.updateDishById = async (req, res) => {
  try {
    const updatedDish = await Dish.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
    });
    if (!updatedDish) {
      return res.status(404).json({ message: "Dish not found" });
    }
    res
      .status(200)
      .json({ message: "Dish updated successfully", dish: updatedDish });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller to delete dish by ID
exports.deleteDishById = async (req, res) => {
  try {
    const deletedDish = await Dish.findByIdAndDelete(req.params.id);
    if (!deletedDish) {
      return res.status(404).json({ message: "Dish not found" });
    }
    res.status(200).json({ message: "Dish deleted successfully" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
