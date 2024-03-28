const express = require("express");
const mongoose = require("mongoose");
const dotenv = require("dotenv");
const userRoutes = require("./routes/userRoutes");
const cookerRoutes = require("./routes/cookerRoutes");
const orderRoutes = require("./routes/orderRoutes");
const cartRoutes = require("./routes/cartRoutes");

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Connect to MongoDB
dotenv.config();

const MONGOURL = process.env.MONGO_URL;

mongoose
  .connect(MONGOURL)
  .then(() => {
    console.log("Connected to MongoDB");
  })
  .catch((error) => {
    console.error("Error connecting to MongoDB:", error.message);
  });

// Routes
app.use("/user", userRoutes);
app.use("/cooker", cookerRoutes);
app.use("/order", orderRoutes);
app.use("/cart", cartRoutes);

// Handle 404 errors
app.use((req, res, next) => {
  res.status(404).json({ error: "Not found" });
});

// Error handling middleware
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: "Internal server error" });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
