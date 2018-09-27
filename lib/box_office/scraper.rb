class BoxOffice::Scraper
  def self.scrape_movie_list # Scrapes website and creates Movie objects
    movie_list = Nokogiri::HTML(open("https://www.rottentomatoes.com/browse/box-office/?rank_id=0&country=us"))

    movie_list.css("table.center.table tr[itemprop='itemListElement']").each do |row|
      movie = BoxOffice::Movie.new
      movie.title = row.css("td.left a").text.strip
      movie.link = row.css("td.left a").attr("href").text.strip
      movie.earnings = row.css("td[7]").text.strip
    end
  end

  def self.scrape_movie_page(index) # Scrapes movie webpage and creates hash of movie attributes
    attributes = {}
    movie_page = Nokogiri::HTML(open("https://www.rottentomatoes.com/#{BoxOffice::Movie.all[index].link}"))

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

    # Scraping basic movie info and storing it in a hash
    info_keys = []
    info_values = []
    movie_page.css("ul.content-meta.info div.meta-label.subtle").each { |key| info_keys << key.text.strip }
    movie_page.css("ul.content-meta.info div.meta-value").each { |value| info_values << value.text.gsub(/\n\s*/, "").strip }
    info_hash = [info_keys, info_values].transpose.to_h

    # Combining all scraped info into one hash called 'attributes'
    info_hash.each do |key, value|
      case key
      when "Rating:"
        attributes[:rating] = value
      when "Genre:"
        attributes[:genres] = value
      when "Directed By:"
        attributes[:director] = value
      when "Written By:"
        attributes[:writers] = value
      when "In Theaters:"
        attributes[:release_date] = value
      when "Runtime:"
        attributes[:runtime] = value
      when "Studio:"
        attributes[:studio] = value
      end
     end

    attributes[:synopsis] = movie_synopsis
    attributes[:critic_score] = movie_critic_score
    attributes[:audience_score] = movie_audience_score
    attributes[:cast] = movie_cast

    attributes
  end

end
