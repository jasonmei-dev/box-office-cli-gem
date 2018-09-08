class TopMovies::CLI

  def run
    puts "Welcome! Please enter a year to see its top 10 movies (2014 - 2018):"
    year = gets.strip.to_i
    if !year.between?(2014, 2018)
      puts "Invalid year. Please enter years between 2014 - 2018."
    else
      list_movies
    end
  end

  def list_movies
    puts <<-DOC
    1. Avengers Infinity War
    2. Black Panther
    3. Captain America - Civil War
    4. Spider-Man Homecoming
    5. Marvel's The Avengers
    6. Captain America - Winter Soldier
    7. Iron Man
    8. Captain America - The First Avenger
    9. Thor
    10. Guardians of the Galaxy
    DOC
  end
end
