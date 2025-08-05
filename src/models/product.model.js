import database from "../config/database.js"


const create = async (productData) => {
    const { Title_kelas, Deskripsi, Price} = productData;

    const [result] = await database.execute(`
        INSERT INTO 
            kelas (Title_kelas, Deskripsi, Price) 
        VALUES  (?, ?, ?)`
    , [Title_kelas, Deskripsi, Price])

    return result.insertId
};

const update = async (productData, id) => {
    const {Title_kelas, Deskripsi, Price} = productData;

    const [result] = await database.execute(`
        UPDATE kelas 
        SET Title_kelas = ?, Deskripsi = ?, Price = ?
        WHERE Kelas_ID = ?`, 
        [Title_kelas, Deskripsi, Price, id])

    return result.insertId
};


const getAll = async() => {
    const [rows] = await database.execute("SELECT * FROM kelas");
    
    return rows;
}

const getById = async (id) => {
    const [rows] = await database.execute("SELECT * FROM kelas WHERE Kelas_ID = ?", [id]);

    return rows[0];
}

const deleteById = async (id) => {
    const [rows] = await database.execute("DELETE FROM kelas WHERE Kelas_ID = ?", [id]);

    return rows;
}

const productModel = {
    create,
    getAll,
    getById,
    deleteById,
    update
}

export default productModel