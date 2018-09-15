require_relative '../lib/scraper.rb'
require_relative '../lib/movie.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'

class CommandLineInterface
  def run
    list_movies
    menu
    goodbye
  end

  def list_movies
    puts "Last Weekend's Box Office Top Ten:"
    @movies_list = Scraper.scrape_movie_list
    @movies_list.each_with_index do |(movie, earnings), i|
      puts "#{i + 1}. #{movie}, #{earnings}"
    end
  end

  def add_attributes_to_movie(index)
    movie = Movie.all[index]
    attributes = Scraper.scrape_movie_page(index)
    movie.add_movie_attributes(attributes)
  end

  def display_movie_info(index)
    movie = Movie.all[index]
    puts <<-DOC.gsub(/^\s*/, "")
    Title: #{movie.title}
    Rating: #{movie.rating}
    Genres: #{movie.genres}
    Director: #{movie.director}
    Writers: #{movie.writers}
    Runtime: #{movie.runtime}
    Studio: #{movie.studio}
    Critic Score: #{movie.critic_score}
    Audience Score: #{movie.audience_score}
    Synopsis: #{movie.synopsis}
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the movie to see more info, or 'list' to see the list again, or type 'exit':"
      input = gets.strip.downcase
      if input.to_i.between?(1, 10)
        add_attributes_to_movie(input.to_i - 1)
        display_movie_info(input.to_i - 1)
      elsif input == "list"
        list_movies
      elsif input != "exit"
        puts "Invalid entry. Please enter 'list' or 'exit':"
      end
    end
  end

  def goodbye
    puts "Goodbye! Check back next week to see the box office rankings!"
  end
end
