const Cooker = require("../models/cooker");
const bcrypt = require("bcrypt");

// Controller for cooker sign-up
exports.signup = async (req, res) => {
  try {
    // Create a new cooker based on request body
    const newCooker = new Cooker(req.body);
    await newCooker.save();
    res.status(201).json({ message: "Cooker created successfully" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

// Controller for cooker sign-in
exports.signin = async (req, res) => {
  try {
    const { email, password } = req.body;
    // Find the cooker by email
    const cooker = await Cooker.findOne({ email });
    if (!cooker) {
      return res.status(401).json({ error: "Invalid email or password" });
    }
    // Check if the password is correct
    const isPasswordValid = await bcrypt.compare(password, cooker.password);
    if (!isPasswordValid) {
      return res.status(401).json({ error: "Invalid email or password" });
    }
    res.status(200).json({ message: "Cooker signed in successfully" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
