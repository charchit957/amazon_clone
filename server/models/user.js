const e = require("express");
const mongoose = require("mongoose");

const userSchema = new mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validator: (value) => {
      const re =
        /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
      return value.match(re);
    },
    message: "Please enter a valid email",
  },
    password: {
    required: true,
    type: String,
    },
    address: {
        type: String,
        default: ""
    },
    type: {
        type: String,
        default: "user"
    },
    //cart
});

const User = mongoose.model("User", userSchema);
module.exports = User;