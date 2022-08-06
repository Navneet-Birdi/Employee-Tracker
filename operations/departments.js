const { connect } = require("../db/connection")


async function addDepartment(name){

  const db = await connect();

  await db.query('INSERT INTO `employee_demo`.`department` (`name`) VALUES (?)', name);
}


async function getDepartment(){

  const db = await connect();

  const [department] = await db.query('SELECT * FROM department');
  
  return department;

}


module.exports = {

  addDepartment,
  getDepartment,
}