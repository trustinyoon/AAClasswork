import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';

const mstp = (state, otherProps) => ({
    pokemon: state.pokemon[otherProps.match.params.id],
    items: getItemsForPokemon(otherProps.match.params.id),
    // moves: getMovesForPokemon(otherProps.match.params.id)
})