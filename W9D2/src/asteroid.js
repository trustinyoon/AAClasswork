const MovingObject = require("./moving_object");
const Util = require("../util");

Util.inherits(Asteroid, MovingObject);

function Asteroid(obj) {
    this.color = "#5085BC";
    this.radius = 3;
    MovingObject.call(this, obj);
}

module.exports = Asteroid;

