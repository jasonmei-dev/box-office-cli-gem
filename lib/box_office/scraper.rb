class BoxOffice::Scraper
  @@movie_links = []

  def self.scrape_movie_list # Creates Movie objects and creates hash with movie titles and earnings from scraped website
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
    all_info = {}
    movie_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/#{@@movie_links[index]}"))

    # Scraping synopsis and cast
    movie_synopsis = movie_page.css("div#movieSynopsis").text.strip
    movie_cast = movie_page.css("div.castSection a span").text.gsub(/^\s*/, "").gsub(/\n/, ", ")

    # Scraping critic and audience scores
    if movie_page.css("span.meter-value")[0].nil?
      movie_critic_score = "No Score Yet"
    else
      movie_critic_score = movie_page.css("span.meter-value")[0].text
    end

    if movie_page.css("div.audience-score.meter").text.strip == "No Score Yet"
      movie_audience_score = "No Score Yet"
    else
      movie_audience_score = movie_page.css("div.audience-score.meter").text.split[0]
    end

    # Scraping basic movie info and storing it into a hash
    info_keys = []
    info_values = []

    movie_page.css("ul.content-meta.info div.meta-label.subtle").each { |key| info_keys << key.text.strip }
    movie_page.css("ul.content-meta.info div.meta-value").each { |value| info_values << value.text.gsub(/\n\s*/, "").strip }

    info_hash = [info_keys, info_values].transpose.to_h

    # Combining all scraped info into one hash called 'all_info'
    info_hash.each do |key, value|
      case key
      when "Rating:"
        all_info[:rating] = value
      when "Genre:"
        all_info[:genres] = value
      when "Directed By:"
        all_info[:director] = value
      when "Written By:"
        all_info[:writers] = value
      when "In Theaters:"
        all_info[:release_date] = value
      when "Runtime:"
        all_info[:runtime] = value
      when "Studio:"
        all_info[:studio] = value
      end
     end

    all_info[:synopsis] = movie_synopsis
    all_info[:critic_score] = movie_critic_score
    all_info[:audience_score] = movie_audience_score
    all_info[:cast] = movie_cast

    all_info
  end

end
