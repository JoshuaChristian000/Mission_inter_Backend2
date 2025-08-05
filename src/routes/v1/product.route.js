import express from "express"
import productController from "../../controllers/product.controller.js"

const router = express.Router()

router.post('/', productController.create)
router.get('/:id', productController.getProductById)
router.get('/', productController.getAll)
router.delete('/:id', productController.deleteById)
router.put('/:id', productController.update)

export default router