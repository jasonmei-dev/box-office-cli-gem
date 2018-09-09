require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_movie_list
    url = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    # binding.pry
    movies = []
    box_office = []

    url.css("table td.left a").each do |movie|
      movies << movie.text if movies.length < 10
    end

    url.css("table td[7]").each do |earnings|
      box_office << earnings.text if box_office.length < 10
    end
    binding.pry
    movies
  end

end
