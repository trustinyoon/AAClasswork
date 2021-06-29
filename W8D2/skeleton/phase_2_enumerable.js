Array.prototype.myEach= function (callback) {
    this.forEach(ele => console.log(callback(ele)))
} 

function addOne(num) {
    return num + 1
}

console.log([1,2,3,4,5].myEach(addOne))

// ------------------------------------------------------------------------

