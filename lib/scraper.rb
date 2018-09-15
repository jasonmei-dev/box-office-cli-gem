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
    # binding.pry
    [titles, earnings].transpose.to_h
  end

  def self.scrape_movie_pages
    all_info = []

    @@movie_links.each do |link|
      movie_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/#{link}"))

      movie_synopsis = movie_page.css("div#movieSynopsis").text.strip
      movie_critic_score = movie_page.css("span.meter-value")[0].text
      movie_audience_score = movie_page.css("div.meter-value").text.strip

      all_info << { synopsis: movie_synopsis, critic_score: movie_critic_score, audience_score: movie_audience_score }
      #
      # movie_page.css("div.meta-value").each do |info|
      #   all_info << info.text.strip
      # end
      # binding.pry
    end
    # binding.pry
    all_info
  end

# synopsis = movie_page.css("div#movieSynopsis").text.strip
# critic_score = movie_page.css("span.meter-value")[0].text
# audience_score = movie_page.css("div.meter-value").text.strip
end
