# require_relative "./version"
# require_relative "./cli"

class Movie
  attr_accessor :title, :synopsis, :genre, :director, :writers, :main_cast, :runtime, :critic_score, :audience_score
  @@all = []

  def initialize(title)
    @title = title
    @@all << self if @@all.length < 10
  end

  def add_movie_attributes(attr_hash)
    attr_hash.each do |key, value|
      self.send("#{key}=", value)
    end
  end

  def self.all
    @@all
  end
end
