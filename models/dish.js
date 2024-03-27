const mongoose = require("mongoose");

const dishSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: { type: String },
  price: { type: Number, required: true },
  // Other fields you may want to include, such as ingredients, category, etc.
});

const Dish = mongoose.model("Dish", dishSchema);

module.exports = Dish;
