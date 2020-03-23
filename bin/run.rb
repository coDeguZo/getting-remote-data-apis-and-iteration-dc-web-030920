#!/usr/bin/env ruby

require 'pry'

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
user_input = get_input_from_user.strip
# binding.pry
if user_input.to_i == 2
    character_prompt
    character = get_input_from_user
    show_character_movies(character)
elsif user_input.to_i == 1
    movie_prompt
    movie = get_input_from_user
    show_movies_info(movie)
end


