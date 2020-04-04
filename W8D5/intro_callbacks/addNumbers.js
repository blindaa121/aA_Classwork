const readline = require("readline");

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) {
    //Prompt the user for a number(use reader)
    if (numsLeft > 0) {
        reader.question('Please enter a number: ', function (num) {
            //Uses parseInt to parse the integer
            const thisNumber = parseInt(num);
            // Increment the sum and console.log it 
            sum += thisNumber;
            console.log(sum);
            //Recursively calls addNumbers again, passing in: increased sum, numsLeft, and the same completionCallback
            addNumbers(sum, numsLeft - 1, completionCallback)
        });
    } else {
      completionCallback(sum); // if numsLeft === 0, call completionCallback(sum) so that the total sum can be used.  
    }
}

addNumbers(0, 3, sum => {
    console.log(`Total Sum: ${sum}`);
    reader.close(); // close out the reader
});