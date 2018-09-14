# require_relative "./version"
# require_relative "./cli"

class Movie
  attr_accessor :title, :genre, :director, :writers, :main_cast, :runtime, :critic_score, :audience_score
  @@all = []

  def initialize
    @@all << self if @@all.length < 10
  end

  def self.all
    @@all
  end
end
