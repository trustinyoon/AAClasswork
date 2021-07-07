const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

document.addEventListener('DOMContentLoaded', function () {
  window.MovingObject = MovingObject;

  let canvasElement = document.getElementById("game-canvas");
  const ctx = canvasElement.getContext("2d");
  console.log(ctx);
  // debugger
const mo = new MovingObject({
  pos: [30, 30],
  vel: [10, 10], 
  radius: 5,
  color: "#00FF00"
});

const ast = new Asteroid({
  pos: [50, 50],
  vel: [20, 20],
  });

mo.draw(ctx);
ast.draw(ctx);

});

