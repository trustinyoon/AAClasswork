Array.prototype.uniq = function () {
  let unique = [];

  this.forEach(function (el) {
    if (!unique.includes(el)) {
      unique.push(el);
    };
  });

  return unique;
};

console.log([1, 2, 2, 3, 3, 3].uniq());