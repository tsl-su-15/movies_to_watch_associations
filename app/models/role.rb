class Role < ActiveRecord::Base
  def actor
    Actor.find(actor_id)
  end

  def movie
    Movie.find(movie_id)
  end
end
