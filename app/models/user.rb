class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :watchlist_items

  def watched_movie_count
    list_of_movies = []
    watchlist_items.each do |item|
      list_of_movies << item.movie
    end
    return list_of_movies.count
  end
end
