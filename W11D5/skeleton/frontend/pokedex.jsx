import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon } from './actions/pokemon_actions';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");
  window.receiveAllPokemon = receiveAllPokemon;
  ReactDOM.render(<h1>Pokemon</h1>, root);
});