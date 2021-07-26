export const selectAllPokemon = (state) => {
  return Object.values(state.entities.pokemon)
}

export const getItemsForPokemon = (state, targetId) => {
  let selectedItems = [];
  state.entities.items.forEach(item => {
    if (item.pokemonId === targetId) selectedItems.push(item);
  })
  return selectedItems
}

export const getMovesForPokemon = (state, targetId) => {

}