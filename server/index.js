//import from packages
const express = require("express");
const mongoose = require("mongoose");

//import from other files
const authRouter = require("./routes/auth");
const adminRouter = require("./routes/admin");

//Inits
const PORT = 3000;
const app = express();
const DB =
  "mongodb+srv://charchit957:charchit957388@cluster0.ytl6zzc.mongodb.net/?retryWrites=true&w=majority";

//middlewaresa
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);

//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("connected to db");
  })
  .catch((err) => {
    console.log(err);
  });

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at ${PORT}`);
});
