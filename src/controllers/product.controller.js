import productService from "../services/product.service.js";

const create = async (req, res) => {
    try{
        const {Title_kelas, Deskripsi, Price} = req.body;

        if (!Title_kelas || !Deskripsi || !Price ){
            return res
                .status(400)
                .json({success: false, message: "Title, Deskripsi, Price are required"})
        } 

        const productData = req.body;
        const productId = await productService.create(productData);
        productData.productId = productId

        return res.status(201).json({success: true, data: productData})
    } catch (error) {
            console.error("Error creating product", error);
            if(error.code === "ER_DUP_ENTRY"){
                return res 
                    .status(409)
                    .json({ message: "Product already exists."});
            }
            res
                .status(500)
                .json({message: "Internal Server Error", error: error.message})
        }
};

const update = async (req, res) => {
    try{
        const {id} = req.params
        const {Title_kelas, Deskripsi, Price} = req.body;

        const product = await productService.getById(id)

        if (!product) {
            return res.status(404).json({message: "Product Not Found"})
        }

        if (!Title_kelas || !Deskripsi || !Price){
            return res
                .status(400)
                .json({success: false, message: "Title, Deskripsi, Price are required"})
        } 

        const productData = req.body;
        const productId = await productService.update(productData, id);
        productData.productId = productId

        return res.status(201).json({success: true, data: productData})
    } catch (error) {
            console.error("Error updating product", error);
            if(error.code === "ER_DUP_ENTRY"){
                return res 
                    .status(409)
                    .json({ message: "Product already exists."});
            }
            res
                .status(500)
                .json({message: "Internal Server Error", error: error.message})
        }
};

const getProductById = async (req, res) => {
    try {
        const {id} = req.params
        const product = await productService.getById(id)

        if (!product) {
            return res.status(404).json({message: "Product Not Found"})
        }

        res.status(200).json(product);
    } catch (error) {
        console.error("Error fetching product by id: ", error);
        res
            .status(500)
            .json({message: "Internal Server Error", error: error.message, success: false})
        
    }
}

const getAll = async (req, res) => {
    try {
        const product = await productService.getAll()

        res.status(200).json({data: product, success: true});
    } catch (error) {
        console.error("Error fetching products", error);
        res
            .status(500)
            .json({message: "Internal Server Error", error: error.message, success: false})
        
    }
}

const deleteById = async (req, res) => {
    try {
        const {id} = req.params
        const product = await productService.deleteById(id)

        if (!product) {
            return res.status(404).json({message: "Product Not Found"})
        }

        res.status(200).json(product);
    } catch (error) {
        console.error("Error Delete product by id: ", error);
        res
            .status(500)
            .json({message: "Internal Server Error", error: error.message, success: false})
        
    }
}


const productController ={
    create,
    getProductById,
    getAll,
    deleteById,
    update
}

export default productController