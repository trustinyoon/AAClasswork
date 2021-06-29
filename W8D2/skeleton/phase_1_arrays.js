Array.prototype.uniq = function () {
  let unique = [];

  this.forEach(function (el) {
    if (!unique.includes(el)) {
      unique.push(el);
    }
  })

  return unique;
};

// console.log([1, 2, 2, 3, 3, 3].uniq());


// ------------------------------------------------------------------------
Array.prototype.twoSum = function () {
  let arr = [];

  for (let i = 0; i < this.length - 1; i++) {
    for (let j = i+1; j < this.length; j++) {
      if (this[i] + this[j] === 0) {
        arr.push([this[i], this[j]]);
      }
    }
  }

  return arr;
};

// console.log([1, -2, 2, -3, 3, 3].twoSum());
// console.log([4, -4, 5, 6, -5].twoSum());

// ------------------------------------------------------------------------
Array.prototype.transpose = function () {
  let arr = [];

  for (let i = 0; i < this.length; i++) {
    arr.push([]); 
  }
// []
  for (let i = 0; i < this.length; i++) {
    for (let j = 0; j < this.length; j++) {
      // arr[j].push(this[i][j]);
      arr[i][j] = this[j][i];
    }
  }

  return arr;
}

// console.log([[0, 1], [2, 3]].transpose()); // => [[0,2],[1,3]]