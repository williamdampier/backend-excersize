require('dotenv').config();

const Pool = require('pg').Pool;
const pool = new Pool({
    user: process.env.PG_USER,
    password: process.env.PG_PASSWORD,
    host: process.env.PG_HOST,
    port: process.env.PG_PORT,
    database: "billyz_db"
});

module.exports = pool;