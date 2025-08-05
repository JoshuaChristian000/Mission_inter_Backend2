import mysql from "mysql2/promise"
import dotenv from "dotenv"

dotenv.config()

const pool = mysql.createPool({
    host: process.env.HOST,
    port: process.env.DB_PORT,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DATABASE,
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0,
})

async function testDBConnection() {
    try {
        const connection = await pool.getConnection();
        console.log("Succesfully Connect");
        connection.release();
    } catch (error) {
        console.error("Error Connect", error.message);
        process.exit(1);
    }
}

testDBConnection();

export default pool