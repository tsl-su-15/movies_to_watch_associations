Rails.application.routes.draw do
  devise_for :users
  root to: 'movies#index'
  resources :roles, :directors, :actors, :movies, :watchlist_items

  post '/watchlist_items/watched', :controller => 'watchlist_items', :action => 'watch', :as => 'watch_watchlist_item'
  patch '/watchlist_items/:id/unwatch', :controller => 'watchlist_items', :action => 'unwatch', :as => 'unwatch_watchlist_item'
end
