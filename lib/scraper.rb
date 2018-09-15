require 'nokogiri'
require 'open-uri'

class Scraper
  @@movie_links = []

  def self.scrape_movie_list
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    titles = []
    earnings = []

    movie_list.css("table td.left a").each do |title|
      @@movie_links << title.attr("href") if @@movie_links.length < 10
      movie = Movie.new(title.text)
      titles << movie.title if titles.length < 10
    end

    movie_list.css("table td[7]").each do |earning|
      earnings << earning.text if earnings.length < 10
    end

    [titles, earnings].transpose.to_h
  end

  def self.scrape_movie_page(index)
    movie_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/#{@@movie_links[index]}"))
    info_hash = {}
    movie_info = []

    movie_page.css("div.meta-value").each do |info|
      movie_info << info.text.gsub(/\s+/, " ").strip

    end

    movie_synopsis = movie_page.css("div#movieSynopsis").text.strip
    movie_critic_score = movie_page.css("span.meter-value")[0].text
    movie_audience_score = movie_page.css("div.meter-value").text.strip

    info_hash[:synopsis] = movie_synopsis
    info_hash[:critic_score] = movie_critic_score
    info_hash[:audience_score] = movie_audience_score
    info_hash[:rating] = movie_info[0]
    info_hash[:genres] = movie_info[1]
    info_hash[:director] = movie_info[2]
    info_hash[:writers] = movie_info[3]
    info_hash[:runtime] = movie_info[5]
    info_hash[:studio] = movie_info[6]

    info_hash
  end

# synopsis = movie_page.css("div#movieSynopsis").text.strip
# critic_score = movie_page.css("span.meter-value")[0].text
# audience_score = movie_page.css("div.meter-value").text.strip
end
