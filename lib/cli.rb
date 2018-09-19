require_relative '../lib/scraper.rb'
require_relative '../lib/movie.rb'

require 'colorize'
require 'pry'

class CommandLineInterface
  def run
    list_movies
    menu
    goodbye
  end

  def list_movies
    puts "Last Weekend's Box Office Top Ten:".colorize(:red)
    @movies_list = Scraper.scrape_movie_list
    @movies_list.each_with_index do |(movie, earnings), i|
      puts "#{i + 1}.".colorize(:blue) + " #{movie}, #{earnings}"
    end
    puts "----------------------".colorize(:green)
  end

  def add_attributes_to_movie(user_input)
    movie = Movie.all[user_input]
    attributes = Scraper.scrape_movie_page(user_input)
    movie.add_movie_attributes(attributes)
  end

  def display_movie_info(user_input)
    movie = Movie.all[user_input]
    puts "#{movie.title}".colorize(:red)
    puts "Rating:".colorize(:blue) + " #{movie.rating}"
    puts "Genres:".colorize(:blue) + " #{movie.genres}"
    puts "Director:".colorize(:blue) + " #{movie.director}"
    puts "Writers:".colorize(:blue) + " #{movie.writers}"
    puts "Cast:".colorize(:blue) + " #{movie.cast}"
    puts "Critic Score:".colorize(:blue) + " #{movie.critic_score}"
    puts "Audience Score:".colorize(:blue) + " #{movie.audience_score}"
    puts "Synopsis:".colorize(:blue) + " #{movie.synopsis}"
    puts "----------------------".colorize(:green)
  end

  def menu
    input = nil
    until input == "exit"
      puts "Enter the number of the movie to see more info, or 'list' to see the list again, or 'exit' to leave the app:"
      input = gets.strip.downcase
      if input.to_i.between?(1, 10)
        add_attributes_to_movie(input.to_i - 1)
        display_movie_info(input.to_i - 1)
      elsif input == "list"
        list_movies
      elsif input != "exit"
        puts "Invalid entry!".colorize(:red)
      end
    end
  end

  def goodbye
    puts "Peace out homie! <3"
  end
end
