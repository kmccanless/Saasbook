class MovieView < Movie
  attr_accessor :sort
  attr_accessor :movies
  attr_accessor :filter

  def all_ratings
      ['G','PG','PG-13','R']
  end
end
