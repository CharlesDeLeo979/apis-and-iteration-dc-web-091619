require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  films = []
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
 # iterate over the response hash to find the collection of `films` for the given  `character`
  response_hash["results"].each do |char_data|
   if char_data["name"].downcase == character_name
    films << char_data["films"]
   end
  end
  filmsflatten = films.flatten
  # collect those film API urls, make a web request to each URL to get the info for that film
  response_film = filmsflatten.map do |film|
    response = RestClient.get(film)
     JSON.parse(response)
  end
  response_film
  

  

  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.



end

def print_movies(films)
  filmslist = []
  films.map do |film|
    filmslist << film["title"]
  end
  puts filmslist
  # binding.pry
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
  # binding.pry
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
