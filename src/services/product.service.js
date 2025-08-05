import productModel from "../models/product.model.js"

const create = (productData) => {
    return productModel.create(productData);
}

const update = (productData, id) => {
    return productModel.update(productData, id);
}

const getAll = () =>{
    return productModel.getAll();
}

const getById = (id) =>{
    return productModel.getById(id);
}

const deleteById = (id) => {
    return productModel.deleteById(id);
}

const productService = {
    create,
    getAll,
    getById,
    deleteById,
    update
}

export default productService