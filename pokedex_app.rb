# frozen_string_literal: true

require_relative './services/pokemon_details_fetcher'
require_relative './exceptions/network_error'

# Pokedox Sinatra APP
class PokedexApp < Sinatra::Application
  enable :sessions

  get '/' do
    begin
      @pokemon = PokemonDetailsFetcher.fetch_random_pokemon_data
    rescue NetworkError
      @error_message = 'Pokedox API network request unsuccessful!! Try reloading the page again!'
    end
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
