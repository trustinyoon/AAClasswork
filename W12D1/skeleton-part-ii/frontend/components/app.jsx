import React from 'react';
import { Route } from "react-router-dom";
import PokemonIndexContainer from './../components/pokemon/pokemon_index_container';
import PokemonDetailContainer from './../components/pokemon/pokemon_detail_container';

const App = () => (
  <div>
    <Route path="/" component={PokemonIndexContainer} />
    <Route path="/pokemon/:id" component={PokemonDetailContainer} />
  </div>
)

export default App;