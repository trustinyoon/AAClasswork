const View = require("./ttt-view")// require appropriate file
const Game = require("../ttt_node/game")// require appropriate file

document.addEventListener("DOMContentLoaded", () => {
  // Your code here
  const game = new Game();
  const container = document.querySelector(".ttt");
  new View(game, rootEl);
  console.log("HI")
  
});
