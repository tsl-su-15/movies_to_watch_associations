class Movie < ActiveRecord::Base
  def director
    Director.find(director_id)
  end

  def roles
    Role.where(movie_id: id)
  end
end
