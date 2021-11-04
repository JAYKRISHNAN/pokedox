# frozen_string_literal: true

require_relative 'spec_helper'
class AppSpec < PokedexAppSpec
  describe '/' do
    let(:result) { get '/' }
    let(:expected_pokemon) do
      OpenStruct.new(
        {
          name: 'CLEFABLE',
          species: 'clefable',
          height: '13',
          weight: '400',
          image_url: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/36.png',
          location_names: ['giant chasm outside', 'giant chasm forest', 'giant chasm forest cave']
        }
      )
    end

    it 'successfully displays required details of a pokemon' do
      VCR.use_cassette('random_pokemon_details') do
        PokemonDetailsFetcher.stub(:random_pokemon_id, 36) do
          assert_equal 200, result.status
          page_html = result.body

          assert_includes page_html, expected_pokemon.name
          assert_includes page_html, expected_pokemon.image_url
          assert_includes page_html, expected_pokemon.species
          assert_includes page_html, expected_pokemon.height
          assert_includes page_html, expected_pokemon.weight
          assert_includes page_html, expected_pokemon.location_names.join(', ')
        end
      end
    end
  end
end
