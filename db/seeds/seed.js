const { seedDepartment } = require("./seed-department");





async function main(){

  await seedDepartment();
}



main();