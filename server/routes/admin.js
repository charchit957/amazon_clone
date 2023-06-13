const express = require("express");
const admin = require("../middlewares/admin");
const Product = require("../models/product");

const adminRouter = express.Router();
//add product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, price, description, category, quantity, images } = req.body;
    let newProduct = new Product({
      name,
      price,
      description,
      category,
      quantity,
      images,
    });
    const savedProduct = await newProduct.save();
    res.json(savedProduct);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRouter;
