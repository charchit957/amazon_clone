console.log("hello")

const PORT = 3000
//import
const express = require('express')
const app=express()

//CREATING AN API
//GET,PUT,POST,DELETE,UPDATE = > CRUD

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`connected at ${PORT}`)
})