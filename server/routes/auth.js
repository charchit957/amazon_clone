const express = require("express");
const bcrypt = require("bcryptjs");
const User = require("../models/user");
const authRouter = express.Router();

//SIGNUP
authRouter.post("/api/signup", async(req, res) => {
  try {
    //get data from client
    const { name, email, password } = req.body;
    //validate data
    const existingUser =await User.findOne({email});
    if (existingUser) {
      return res.status(400).json({ message: "user already exists" });
    }
    //post data to database
    const hashedPassword = await bcrypt.hash(password, 12);
    let user = new User({ email, password:hashedPassword, name });
    user =await user.save();
    res.json(user);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

module.exports = authRouter;
