var mysql = require("mysql");
var inquirer = require("inquirer");
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
    getUserInput();
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
    } else {
      // catch the error of the valid product id
      console.log(val,'Of User Input')
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
      // console.table(data);
      var stockQuantity = data[0].stock_quantity;
      var ID = data[0].id;
      console.log(userQuantity)
      // if vaild stock update the quantity
      updateQuantity(ID, userQuantity, stockQuantity);
    });
  })
}

function updateQuantity(ID, userQuantity, stockQuantity){
  console.log("Updating product quantities\n");
  var query = connection.query(
    "UPDATE products SET ? WHERE ?",
    [
      {
        stock_quantity: stockQuantity - userQuantity
      },
      {
        id: ID 
      }
    ],
    function(err, res) {
      if (err) throw err;
      console.log(res.affectedRows + " products updated!\n");
    }
  );

}