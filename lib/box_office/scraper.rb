class BoxOffice::Scraper
  @@movie_links = []

  def self.scrape_movie_list # creates Movie objects and creates hash with movie titles and earnings from scraped website
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))
    titles = []
    earnings = []

    movie_list.css("table td.left a").each do |title|
      @@movie_links << title.attr("href")
      movie = BoxOffice::Movie.new(title.text)
      titles << movie.title
    end

    movie_list.css("table td[7]").each do |earning|
      earnings << earning.text
    end

    [titles, earnings].transpose.to_h
  end

  def self.scrape_movie_page(index) # Scrapes movie webpage and creates hash of movie info
    movie_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/#{@@movie_links[index]}"))
    info_hash = {}
    movie_info = []

    movie_page.css("div.meta-value").each do |info|
      movie_info << info.text.gsub(/\s+/, " ").strip
    end

    if movie_page.css("span.meter-value")[0].nil?
      movie_critic_score = "No Score Yet"
    else
      movie_critic_score = movie_page.css("span.meter-value")[0].text
    end

    if movie_page.css("div.audience-score.meter").text.gsub(/\n\s*/, " ").strip == "No Score Yet"
      movie_audience_score = "No Score Yet"
    else
      movie_audience_score = movie_page.css("div.audience-score.meter").text.split[0]
    end

    movie_synopsis = movie_page.css("div#movieSynopsis").text.strip
    movie_cast = movie_page.css("div.castSection a span").text.gsub(/^\s*/, "").gsub(/\n/, ", ")

    info_hash[:synopsis] = movie_synopsis
    info_hash[:critic_score] = movie_critic_score
    info_hash[:audience_score] = movie_audience_score
    info_hash[:rating] = movie_info[0]
    info_hash[:genres] = movie_info[1]
    info_hash[:director] = movie_info[2]
    info_hash[:writers] = movie_info[3]
    info_hash[:cast] = movie_cast
    # binding.pry
    info_hash
  end

end
