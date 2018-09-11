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

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the movie to see more info, or 'list' to see the list again, or type 'exit':"
      input = gets.strip.downcase
      if input.to_i.between?(1, 10)
        puts "Movie info"
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
