var mysql = require("mysql");
var inquire = require("inquirer");
require("console.table");

var connection = mysql.createConnection({

  host: "localhost",

  port: 3306,

  user: "root",

  password: "Chiwale1",
  database: "bamazon_db"
});

connection.connect(function (err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  afterConnection();
});

function afterConnection() {
  connection.query("SELECT * FROM products", function (err, data) {
    if (err) throw err;
    console.table(data);
  });
}

function getUserInput() {
  inquirer.prompt([
    {
      type: "input",
      name: "choice",
      message: "Enter ID of the product or (Q) to quit",
      validate: function (val) {
        return !isNaN(val) || val.toUpperCase() === "Q";
      }


    }
  ]).then(function (val) {
    var userId = val.choice;
    if (userId === "Q") {
      connection.end()
      console.log("See You Next Time.  Bye")
    }
    else {
      // catch the error of the valid product id
      enterQuantity(userId)
      
    }
  })
}

function enterQuantity(userId) {
  inquirer.prompt([
    {
      type: "input",
      name: "quantity",
      message: "Enter quantity of the product or (Q) to quit",
      validate: function (val) {
        return (val > 0) || val.toUpperCase() === "Q";
      }


    }
  ]).then(function (val) {
    var userQuantity = val.quantity
    // check for the stock quantity
    connection.query("SELECT * FROM products where id = ?",userId, function (err, data) {
      if (err) throw err;
      console.table(data);
    });
  })
}