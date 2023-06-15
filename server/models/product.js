const e = require("express");
const mongose = require("mongoose");
const ratingSchema = require("./ratings");
const productSchema = new mongose.Schema({
  name: {
    type: String,
    required: true,
    trim: true,
  },
  description: {
    type: String,
    required: true,
    trim: true,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  quantity: {
    type: Number,
    required: true,
  },
  price: {
    type: Number,
    required: true,
  },
  category: {
    type: String,
    required: true,
  },
  ratings: [ratingSchema],
});

const Product = mongose.model("Product", productSchema);
module.exports = {Product,productSchema};
