export const fetchAllPokemon = () => {
  return $.ajax({
    method: "GET",
    url: "/api/pokemon"
  })
}

export const fetchSinglePokemon = (pokemon_id) => {
  return $.ajax({
    method: "GET",
    url: `/api/pokemon/${pokemon_id}`
  })
}