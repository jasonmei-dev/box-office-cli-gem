class BoxOffice::Movie
  attr_accessor :title, :link, :earnings, :synopsis, :rating, :genres, :director,
  :writers, :cast, :critic_score, :audience_score, :runtime, :studio, :release_date

  @@all = []

  def initialize
    @@all << self
  end

  def add_movie_attributes(attributes_hash)
    attributes_hash.each do |attr, value|
      self.send("#{attr}=", value)
    end
  end

  def print_info
    puts "#{self.title}".colorize(:red)
    puts "#{self.synopsis}" if self.synopsis != ""
    puts "" if self.synopsis != ""
    puts "Genres:".colorize(:blue) + " #{self.genres}" if !self.genres.nil?
    puts "Rating:".colorize(:blue) + " #{self.rating}" if !self.rating.nil?
    puts "Studio:".colorize(:blue) + " #{self.studio}" if !self.studio.nil?
    puts "Director:".colorize(:blue) + " #{self.director}" if !self.director.nil?
    puts "Writers:".colorize(:blue) + " #{self.writers}" if !self.writers.nil?
    puts "Main Cast:".colorize(:blue) + " #{self.cast}" if self.cast != ""
    puts "Release Date:".colorize(:blue) + " #{self.release_date}" if !self.release_date.nil?
    puts "Runtime:".colorize(:blue) + " #{self.runtime}" if !self.runtime.nil?
    puts "Critic Score:".colorize(:blue) + " #{self.critic_score}"
    puts "Audience Score:".colorize(:blue) + " #{self.audience_score}"
  end

  def self.all
    @@all
  end
end
