class Director < ActiveRecord::Base
  def movies
    Movie.where(director_id: id)
  end
end
