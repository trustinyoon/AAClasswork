Array.prototype.myEach= function (callback) {
    this.forEach(ele => callback(ele))
} 

function addOne(num) {
    return num + 1
}

// console.log([1,2,3,4,5].myEach(addOne))

// ------------------------------------------------------------------------

Array.prototype.myMap = function (callback) {
  let arr = [];

  this.myEach(el => arr.push(callback(el)))

  return arr;
}

// console.log([1, 2, 3, 4, 5].myMap(addOne))

// ------------------------------------------------------------------------

