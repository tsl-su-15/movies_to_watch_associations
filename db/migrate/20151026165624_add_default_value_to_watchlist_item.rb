class AddDefaultValueToWatchlistItem < ActiveRecord::Migration
  def change
    remove_column :watchlist_items, :watched, :boolean
    add_column :watchlist_items, :watched, :boolean, default: false
  end
end
