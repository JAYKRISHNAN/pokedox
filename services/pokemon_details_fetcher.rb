# frozen_string_literal: true

require_relative '../utils/get_json_api_data'
require 'ostruct'

# class to get pokemon data from pokedox API
class PokemonDetailsFetcher
  POKEMON_INDEX_URL = 'https://pokeapi.co/api/v2/pokemon/'
  POKEMON_DETAILS_URL_PREFIX = 'https://pokeapi.co/api/v2/pokemon/'

  def self.fetch_random_pokemon_data
    details_url = POKEMON_DETAILS_URL_PREFIX + random_pokemon_id.to_s
    details = GetJsonApiData.json_api_response(details_url)
    OpenStruct.new({
                     name: details['name'],
                     species: details['species']['name'],
                     height: details['height'],
                     weight: details['weight'],
                     image_url: details['sprites']['front_default'],
                     location_names: pokemon_location_names(details)
                   })
  end

  def self.random_pokemon_id
    rand(1..total_pokemon_count)
  end

  def self.total_pokemon_count
    pokemon_list_details = GetJsonApiData.json_api_response(POKEMON_INDEX_URL)
    pokemon_list_details['count']
  end

  def self.pokemon_location_names(pokemon_details)
    location_url = pokemon_details['location_area_encounters']
    location_details = GetJsonApiData.json_api_response(location_url)
    names = location_details.map { |entry| entry['location_area']['name'] }
    names.map { |name| formatted_location_name(name) }
  end

  def self.formatted_location_name(name)
    name.gsub('-', ' ')
  end
end
