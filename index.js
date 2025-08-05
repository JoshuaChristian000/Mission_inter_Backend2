import express from "express"
import dotenv from "dotenv"
import database from "./src/config/database.js"
import routes from "./src/routes/index.js"

dotenv.config()

const app = express()

const port  = process.env.PORT || "3000"

app.use(express.json())

app.use("/api", routes)

app.use("/health", (req, res)=> {
    res.send({message: "ok"})
})

app.listen(port, () => {
    database.query('SELECT 1')
    console.log(`Server Starting at ${port}`);
    
})
