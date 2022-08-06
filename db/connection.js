try{
    require('dotenv').config();
  }catch(err){
    console.log(err);
  }
  
  
  //importing mysql2
  const mysql = require('mysql2/promise');
  
  
  //connection to database
//  
//     return mysql.createConnection({
//         host: "localhost",
//         password: "root",
//         user: "root",
//         database: "employee_demo",
//       });
   function connect(){
     return mysql.createConnection({
      host: process.env.DB_HOST,
      password: process.env.DB_PASSWORD,
      user: process.env.DB_USER,
      database: 'employee_demo',
     })
  }