def welcome
  # puts out a welcome message here!
  puts "Welcome to our Starwars API, type 1 to search for a movie or type 2 to search for a character: "
end

def get_input_from_user
  # use gets to capture the user's input. This method should return that input, downcased.
  jquery = gets
  jquery
end

def character_prompt
  puts "please enter a character name"
end

def movie_prompt
  puts "please enter a movie title"
end




# def prompt_user
#   # code #prompt_user here
#   puts "Type 'h' to hit or 's' to stay"
# end

# def get_user_input
#   # code #get_user_input here
# gets.chomp
# end

