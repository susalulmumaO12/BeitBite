const express = require("express");
const router = express.Router();
const cookerController = require("../controllers/cookerController");
const dishController = require("../controllers/dishController");

// Cooker sign-up route
router.post("/signup", cookerController.signup);

// Cooker sign-in route
router.post("/signin", cookerController.signin);

// Routes for managing dishes by cooker
router.post("/dishes", dishController.createDish);
router.get("/dishes", dishController.getAllDishes);
router.get("/dishes/:id", dishController.getDishById);
router.put("/dishes/:id", dishController.updateDishById);
router.delete("/dishes/:id", dishController.deleteDishById);

module.exports = router;
