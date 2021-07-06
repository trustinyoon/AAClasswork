const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

document.addEventListener('DOMContentLoaded', (event) => {
  const ctx = document.getElementById("game-canvas");
  ctx.getContext("2d");
});