json.pokemon do
    json.extract! @pokemon, :id, :name, :attack, :defense, :poke_type
    json.image_url ("pokemon_snaps/#{@pokemon.image_url}")
end

json.moves do
    @pokemon.moves.each do |skill|
        json.set! skill.id do
            json.extract! skill, :id, :name
        end
    end
end

json.items do
    @pokemon.items.each do |object|
        json.set! object.id do
            json.extract! object, :id, :pokemon_id, :name, :price, :happiness, :image_url
        end
    end
end
