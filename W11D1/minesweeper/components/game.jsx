import React from 'react';
import {Board,Tile} from '../minesweeper.js';


export default class Game extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      board: new Board(9,5)
    }
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {

  }

  render() {
    return (
      <Board board={this.state.board} updateGame={this.updateGame}/>
    )
  }
}
