const express = require("express");
const admin = require("../middlewares/admin");
const { Product } = require("../models/product");
const Order = require("../models/order");

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

//get all products
adminRouter.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find();
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//delete product
adminRouter.delete("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//get all orders
adminRouter.get("/admin/get-orders", admin, async (req, res) => {
  try {
    const orders = await Order.find();
    res.json(orders);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//change order status
adminRouter.post("/admin/change-order-status", admin, async (req, res) => {
  try {
    const { id, status } = req.body;
    let order = await Order.findById(id);
    order.status = status;
    order = await order.save();
    res.json(order);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//analytics
adminRouter.get("/admin/analytics", admin, async (req, res) => {
  try {
    let orders = await Order.find();
    let totalEarning = 0;
    for (let i = 0; i < orders.length; i++) {
      totalEarning += orders[i].totalPrice;
    }
    //category earning
    let mobileEarning = await fetchCategoryProducts("Mobiles");
    let essentialEarning = await fetchCategoryProducts("Essentials");
    let applianceEarning = await fetchCategoryProducts("Appliances");
    let booksEarning = await fetchCategoryProducts("Books");
    let fashionEarning = await fetchCategoryProducts("Fashion");

    let earning = {
      totalEarning,
      mobileEarning,
      essentialEarning,
      applianceEarning,
      booksEarning,
      fashionEarning,
    };
    res.json(earning)
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

async function fetchCategoryProducts(category) {
  let earning = 0;
  let categoryOrders = await Order.find({
    "products.product.category": category,
  });

  for (let i = 0; i < categoryOrders.length; i++) {
    for (let j = 0; j < categoryOrders[i].products.length; j++) {
      earning +=
        categoryOrders[i].products[j].quantity *
        categoryOrders[i].products[j].product.price;
    }
  }
  return earning;
}
module.exports = adminRouter;
