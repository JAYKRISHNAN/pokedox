# frozen_string_literal: true

require_relative './services/pokemon_details_fetcher'

# Pokedox Sinatra APP
class PokedexApp < Sinatra::Application
  enable :sessions

  get '/' do
    @pokemon = PokemonDetailsFetcher.fetch_random_pokemon_data
    display_page :index
  end

  def display_page(location, locals = {})
    options = {
      layout_options: { views: './views/layouts' },
      layout: locals.fetch(:layout, :default),
      locals: locals
    }

    haml location.to_sym, options
  end

  def display_partial(location, locals = {})
    haml location.to_sym, layout: false, locals: locals
  end
end
