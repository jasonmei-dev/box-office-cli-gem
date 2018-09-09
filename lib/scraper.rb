require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_movie_list
    url = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    movies = []

    url.css("table td a").each do |movie|
      movies << movie.text if movies.length < 10
    end
    movies
  end

end
