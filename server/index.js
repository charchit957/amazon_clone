//import from packages
const express = require("express");
const mongoose = require("mongoose");
const dotenv = require('dotenv').config();
//import from other files
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");
const userRouter = require("./routes/user");

//Inits
const PORT = process.env.PORT || 3000;
const app = express();

//middlewares
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
// connections
mongoose
  .connect(process.env.MONGODB_URI)
  .then(() => {
    console.log("connected to db");
  })
  .catch((err) => {
    console.log(err);
  });
console.log(process.env.MONGO_URL);
app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at ${PORT}`);
});
