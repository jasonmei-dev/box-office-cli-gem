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

  def self.all
    @@all
  end
end
