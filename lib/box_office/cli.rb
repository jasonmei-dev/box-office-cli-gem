class BoxOffice::CLI

  def run
    greeting
    @movies_list = BoxOffice::Scraper.scrape_movie_list
    list_movies
    menu
    goodbye
  end

  def greeting
    puts "Greetings and salutations, moviegoer! Here's last weekend's box office results!"
  end

  def list_movies
    puts "---".colorize(:green)
    puts "Last Weekend's Box Office:".colorize(:red)
    @movies_list.each_with_index do |(movie, earnings), i|
      puts "#{i + 1}.".colorize(:blue) + " #{movie}, #{earnings}"
    end
    puts "---".colorize(:green)
  end

  def add_attributes_to_movie(user_input)
    movie = BoxOffice::Movie.all[user_input]
    attributes = BoxOffice::Scraper.scrape_movie_page(user_input)
    movie.add_movie_attributes(attributes)
  end

  def display_movie_info(user_input)
    movie = BoxOffice::Movie.all[user_input]

    puts "---".colorize(:green)
    puts "#{movie.title}".colorize(:red)
    puts "#{movie.synopsis}"
    puts ""
    puts "Genres:".colorize(:blue) + " #{movie.genres}"
    puts "Rating:".colorize(:blue) + " #{movie.rating}"
    puts "Director:".colorize(:blue) + " #{movie.director}"
    puts "Writers:".colorize(:blue) + " #{movie.writers}"
    puts "Cast:".colorize(:blue) + " #{movie.cast}"
    puts "Critic Score:".colorize(:blue) + " #{movie.critic_score}"
    puts "Audience Score:".colorize(:blue) + " #{movie.audience_score}"
    puts "---".colorize(:green)
  end

  def menu
    input = nil
    until input == "exit"
      puts "Enter movie number to see more info, 'list' to see the list again, or 'exit' to leave the app:"
      input = gets.strip.downcase
      if input.to_i.between?(1, BoxOffice::Movie.all.length)
        add_attributes_to_movie(input.to_i - 1)
        display_movie_info(input.to_i - 1)
      elsif input == "list"
        list_movies
      elsif input != "exit"
        puts "Whoops, please try again!".colorize(:red)
      end
    end
  end

  def goodbye
    puts "Peace out homie! <3"
  end
end
