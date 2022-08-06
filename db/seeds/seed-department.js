const {faker} = require('@faker-js/faker');
const { addDepartment } = require('../../operations/departments');


async function seedDepartment(num = 10){

  
  for (let index = 0; index < num; index++) {
    
    
    await addDepartment(faker.commerce.department())
    
  }
}



module.exports = {
  seedDepartment,
}