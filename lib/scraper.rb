require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_list
    url = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    movies = []

    url.css("tbody").each do |movie|
      movies << movie.css("a").text
    end
    movies
  end

end
