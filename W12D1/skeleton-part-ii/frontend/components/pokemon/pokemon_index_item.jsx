import React from 'react';
import { Link } from 'react-router-dom';

export const PokemonIndexItem = (props) => {
  let url = `/pokemon/${props.pokemon.id}`
  return (
    <li className="pokemon-index-item">
      <Link to={url}>
        <span>{props.pokemon.id}</span>
        <img src={props.pokemon.imageUrl} />
        <span>{props.pokemon.name}</span>
      </Link>
    </li>
  )
}