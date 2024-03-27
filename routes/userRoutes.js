const express = require("express");
const router = express.Router();
const userController = require("../controllers/userController");

// User sign-up route
router.post("/signup", userController.signup);

// User sign-in route
router.post("/signin", userController.signin);

module.exports = router;
