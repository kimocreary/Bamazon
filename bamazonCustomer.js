var mysql = require("mysql");

var connection = mysql.createConnection({
    host: "localhost",

    port: 4000,
  
    user: "root",

    password: "Chiwale1",
    database: "bamazon_db"
  });