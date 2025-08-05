import express from "express"
import indexRoutes from "./v1/index.js"

const router = express.Router()

router.use("/v1", indexRoutes)

export default router