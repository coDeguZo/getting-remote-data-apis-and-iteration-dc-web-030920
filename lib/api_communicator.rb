require 'rest-client'
require 'json'
require 'pry'
require 'awesome_print'

def return_response_hash(url)
  response_string = RestClient.get(url)
  response_hash = JSON.parse(response_string)
  response_hash
end

def get_character_movies_from_api(character_name)
  #make the web request
  # response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = return_response_hash('http://www.swapi.co/api/people/')
  character_info = response_hash["results"].find { |result| result["name"] == character_name.strip}
  movie_urls = character_info["films"]
  movie_hash = movie_urls.map do |url|
    return_response_hash(url)
  end
  movie_hash
  # binding.pry
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  # binding.pry[]
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  count = 1
  films.each do |h|
    puts "*************************"
    puts "#{count}. #{h["title"]}"
    count += 1
    # binding.pry
  end
end

def show_character_movies(character)
  puts "Searching for #{character}..."
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?



def get_movies_from_api(movies)
  #make the web request
  # response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = return_response_hash('http://www.swapi.co/api/films/')
  movie_info = response_hash["results"].find { |result| result["title"] == movies.strip}
  movie_info
end

def print_movies_info(movie_hash)
  # some iteration magic and puts out the movies in a nice list
  puts "****************************"
  puts "Title: #{movie_hash["title"]}"
  puts "****************************"
  puts "Director: #{movie_hash["director"]}"
  puts "****************************"
end

def show_movies_info(movie)
  puts "Searching for #{movie}"
  movie_hash = get_movies_from_api(movie)
  print_movies_info(movie_hash)
end