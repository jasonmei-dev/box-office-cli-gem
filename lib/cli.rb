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
    # puts <<-DOC
    # 1. Crazy Rich Asians, $22.1M
    # 2. The Meg, $10.5M
    # 3. Mission: Impossible - Fallout, $7.0M
    # 4. Searching, $6.1M
    # 5. Operation Finale, $6.0M
    # 6. Christopher Robin, $5.2M
    # 7. Alpha, $4.5M
    # 8. The Happytime Murders, $4.4M
    # 9. BlacKKKlansman, $4.2M
    # 10. Mile 22, $3.6M
    # DOC
    @movies = Scraper.scrape_movie_list
    @movies.each_with_index do |movie, i|
      puts "#{i + 1}. #{movie}" 
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
