const { Pool } = require('pg');

const pool = new Pool({
  host: process.env.HOST,
  user: process.env.USER,
  port: process.env.PORT,
  password: process.env.PASSWORD,
  database: process.env.DB_NAME
})

pool.connect();