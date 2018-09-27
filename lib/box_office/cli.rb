class BoxOffice::CLI
  def run
    greeting
    @movies_list = BoxOffice::Scraper.scrape_movie_list # Generates movie list right away to avoid scraping list multiple times
    list_movies
    menu
    goodbye
  end

  def greeting
    puts "Greetings and salutations, moviegoer! Here's last weekend's box office results!".colorize(:green)
  end

  def list_movies
    puts "---"
    puts "Last Weekend's Box Office:".colorize(:red)
    BoxOffice::Movie.all.each_with_index do |movie, i|
      puts "#{i + 1}.".colorize(:blue) + " #{movie.title}, #{movie.earnings}"
    end
    puts "---"
  end

  def menu
    input = nil
    until input == "exit"
      puts "What do you want to do?".colorize(:green)
      puts "* Enter ".colorize(:green) + "movie number".colorize(:blue) + " to learn more about the movie".colorize(:green)
      puts "* Type '".colorize(:green) + "list".colorize(:blue) + "' to see the list again".colorize(:green)
      puts "* Type '".colorize(:green) + "exit".colorize(:blue) + "' to leave the app".colorize(:green)
      puts "---"
      input = gets.strip.downcase
      if input.to_i.between?(1, BoxOffice::Movie.all.length)
        add_attributes_to_movie(input.to_i - 1) if BoxOffice::Movie.all[input.to_i - 1].rating.nil? # Only scrapes webpage if attributes are 'nil'
        display_movie_info(input.to_i - 1)
      elsif input == "list"
        list_movies
      elsif input != "exit"
        puts "Whoops, please try again!".colorize(:red)
      end
    end
  end

  def add_attributes_to_movie(user_input)
    movie = BoxOffice::Movie.all[user_input]
    attributes = BoxOffice::Scraper.scrape_movie_page(user_input)
    movie.add_movie_attributes(attributes)
  end

  def display_movie_info(user_input)
    movie = BoxOffice::Movie.all[user_input]
    movie.print_info
  end

  def goodbye
    puts "Peace out homie!".colorize(:cyan) + " <3".colorize(:light_red)
  end
end
