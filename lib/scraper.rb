require 'nokogiri'
require 'open-uri'

class Scraper
  @@movie_links = []

  def self.scrape_movie_list
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    movies = []
    earnings = []

    movie_list.css("table td.left a").each do |movie|
      @@movie_links << movie.attr("href") if @@movie_links.length < 10
      movies << movie.text if movies.length < 10
    end

    movie_list.css("table td[7]").each do |earning|
      earnings << earning.text if earnings.length < 10
    end

    [movies, earnings].transpose.to_h
  end

  def self.scrape_movie_page
    all_info = []

    @@movie_links.each do |link|
      movie_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/#{link}"))
      movie_page.css("div.meta-value").each do |info|
        all_info << info.text.strip
      end
      binding.pry
    end
    info
  end

end
