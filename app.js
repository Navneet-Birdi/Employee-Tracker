const inquirer = require('inquirer');
const { getDepartment } = require('./operations/departments');





//recalling function using technical recursion

function main(){
   return inquirer.prompt([
    {
        message:"What would you like to add?",
        type: 'list',
        name: 'operation',
        choices: [
            'view all departments',
            'view all roles',
            'view all employees',
            'add a department',
            'add a role',
            'add an employee',
            'update an employee role',
            'exit',

        ]
    },
    {
        message: "What is the department name?",
      type: 'input',
      name: "department_name",
      when: (ans) => ans.operation === 'add department',
    }
]).then(async (ans) => {

//retrieve choices
switch(ans.operation){
    case "add department":
        const department = await addDepartment(ans.department_name);
        break;

      case "view all departments":
        const departments = await getDepartments();
        console.table(departments);
        break;
  
      case "view all roles":
        break;

      
  
  
      case "exit":
        process.exit(0);
        break;
        
}
//if the user not select the exit
//now calling function outside switch statement

await main();


}) 
}

main();
