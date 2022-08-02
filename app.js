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
    }
]).then(async (ans) => {

//retrieve choices
switch(ans.operation){
    case "view all departments":
    const department =  await getDepartment();
    console.table(department);
    break;

case "view all roles":
    break;

case "exit":
    process.exit(0);

}
//if the user not select the exit
//now calling function outside switch statement

await main();


}) 
}

main();
