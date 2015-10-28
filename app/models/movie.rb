class Movie < ActiveRecord::Base
  belongs_to :director
  # def director
  #   Director.find(director_id)
  # end

  has_many :roles
  # def roles
  #   Role.where(movie_id: id)
  # end
end
