const User = require("../models/user");
const bcrypt = require("bcrypt");

// Controller for user sign-up
exports.signup = async (req, res) => {
  try {
    // Create a new user based on request body
    const newUser = new User(req.body);
    await newUser.save();
    res.status(201).json({ message: "User created successfully" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};

exports.signin = async (req, res) => {
  try {
    const { email, password } = req.body;
    // Find the user by email
    const user = await User.findOne({ email });
    if (!user) {
      return res.status(401).json({ error: "Invalid email or password" });
    }
    // Check if the password is correct
    const isPasswordValid = await bcrypt.compare(password, user.password);
    if (!isPasswordValid) {
      return res.status(401).json({ error: "Invalid email or password" });
    }
    // Password is correct, respond with success message
    res.status(200).json({ message: "User signed in successfully" });
  } catch (error) {
    res.status(400).json({ error: error.message });
  }
};
