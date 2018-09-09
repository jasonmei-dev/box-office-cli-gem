require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_movie_list
    url = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    # binding.pry
    movies = []

    url.css("table td.left a").each do |movie|
      binding.pry
      movies << movie.text if movies.length < 10
    end
    movies
  end

end
