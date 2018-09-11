require 'nokogiri'
require 'open-uri'

class Scraper

  def self.scrape_movie_list
    movies_chart = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    movies = []
    earnings = []

    movies_chart.css("table td.left a").each do |movie|
      movies << movie.text if movies.length < 10
    end

    movies_chart.css("table td[7]").each do |earning|
      earnings << earning.text if earnings.length < 10
    end

    [movies, earnings].transpose.to_h
  end

end
