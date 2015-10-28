class Role < ActiveRecord::Base
  belongs_to :actor
  # def actor
  #   Actor.find(actor_id)
  # end

  belongs_to :movie
  # def movie
  #   Movie.find(movie_id)
  # end
end
