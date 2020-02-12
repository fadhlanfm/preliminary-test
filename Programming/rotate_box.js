// Fadhlan Fariz Makarim
// fadhlan@outlook.co.id
// Javascript, node.js v12.14.0

// this is a function for doing one rotation
function rotate(stackOfBoxes){
    let newStackOfBoxes = []; // define empty array for result

    do{
        var boxLeft = 0; // number of box left
        var subStack = 0; // height of a stack box that will be arranged in newStackOfBoxes

        
        for(let i = 0;i<stackOfBoxes.length;i++){ // we move box by box in the very bottom of every stack
            if(stackOfBoxes[i]>0){  // as long as the stack still has at least one box
                subStack++; // arranged in vertically in a new stack
                stackOfBoxes[i]--;  // the box has been moved into the new stack
            }
            boxLeft += stackOfBoxes[i]; // count how many boxes still left
        }
        newStackOfBoxes.push(subStack); // arrange the new stack in the new container
      }while(boxLeft>0) // do it again until there is no box left in the container
    return newStackOfBoxes; // here's the rotated container
}

function rotate_box(stackOfBoxes, k){
    // convert k into a number between 0 and 3 
    // 0 = no rotation or 360 degree clockwise rotation,
    // 1 = 90 degree clockwise rotation
    // 2 = 180 degree clockwise rotation
    // 3 = 270 degree clockwise rotation
    numberOfRotation = k % 4;

    // we have 4 difference treatments for each k
    switch(numberOfRotation){
        case 0:
            return stackOfBoxes; // simply return without any modification
        case 1:
            return rotate(stackOfBoxes); // rotate 1 time
        case 2:
            return rotate(rotate(stackOfBoxes)); // rotate 2 times
        case 3:
            return rotate(rotate(rotate(stackOfBoxes))); // rotate 3 times
    }
}

// TEST CASE
console.log(rotate_box([2,2,1,3,1,1], 1)) // output: [6, 3, 1]