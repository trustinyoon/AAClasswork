import React from 'react';
import {Board} from '../minesweeper.js';
import MyBoard from './board'

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
      <div>
        <h1>Minesweeper</h1>
        <p>Click to explore a tile.</p>
        <br />
        <p>Alt + click to flag a tile.</p>
        <MyBoard board={this.state.board} updateGame={this.updateGame}/>
      </div>
      
    )
  }
}
