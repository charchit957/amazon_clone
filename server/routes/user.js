const express = require("express");
const auth = require("../middlewares/auth");
const { Product } = require("../models/product");
const User = require("../models/user");
const e = require("express");
const userRouter = express.Router();

//add to cart
userRouter.post("/api/add-to-cart", auth, async (req, res) => {
  try {
    const { id } = req.body;
    const product = await Product.findById(id);
    let user = await User.findById(req.user);
    console.log(user.cart.length);
    if (user.cart.length == 0) {
      user.cart.push({ product: product, quantity: 1 });
    } else {
      let isProductFound = false;
      for (let i = 0; i < user.cart.length; i++) {
        if (user.cart[i].product._id.equals(product._id)) {
          isProductFound = true;
        }
      }
      if (isProductFound) {
        let producttt = user.cart.find((productt) =>
          productt.product._id.equals(product._id)
        );
        producttt.quantity += 1;
      } else {
        user.cart.push({ product: product, quantity: 1 });
      }
    }
    user = await user.save();
    res.status(200).json({ user });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});
module.exports = userRouter;
