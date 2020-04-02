Array.prototype.uniq = function () {
    let uniqVals = [];
    // debugger
    for (let i=0;i < this.length;i++) {
        if (!uniqVals.includes(this[i])) {
            uniqVals.push(this[i])
        }
    }
    return uniqVals;
}

// console.log([1, 2, 2, 3, 3, 3].uniq());

Array.prototype.twoSum = function () {
    let pairs = [];
    for (let i = 0; i < this.length; i++){
        for (let x = i + 1; x < this.length - 1; x++){
            if ((x > i) && ((this[i] + this[x]) == 0)) {
                pairs.push([i, x]);
            }
        }
    }
    return pairs;
}

// console.log([2, -2, 3, 4, -4, 5].twoSum());


Array.prototype.transpose = function () {
    let newArr = new Array(this[0].length); //3 
    for(let col = 0; col < newArr.length; col++) {
      newArr[col] = new Array(this.length); //2
    }
    // debugger
    for (let i = 0; i < this.length; i++) {
        for (let j = 0; j < this[0].length; j++) {
            newArr[j][i] = this[i][j];
        }
    }
    return newArr;
}

// console.log([
//   [1, 2, 3],
//   [4, 5, 6]
// ].transpose())

Array.prototype.myEach = function (callback) {
    for (let i = 0; i < this.length; i++) {
        console.log(i);
        callback(this[i]);
        break;
    }
}


function printer(element) {
  //console.log(element);
  return element;
}

// [1, 2, 3].myEach(printer);

[1,2,3].myEach(printer);