class WatchlistItemsController < ApplicationController
  def index
    @watchlist_items = WatchlistItem.all
  end

  def show
    @watchlist_item = WatchlistItem.find(params[:id])
  end

  def new
    @watchlist_item = WatchlistItem.new
  end

  def create
    @watchlist_item = WatchlistItem.new
    @watchlist_item.user_id = params[:user_id]
    @watchlist_item.movie_id = params[:movie_id]

    if @watchlist_item.save
      redirect_to watchlist_items_url, :notice => "Watchlist item created successfully."
    else
      render 'new'
    end
  end

  def edit
    @watchlist_item = WatchlistItem.find(params[:id])
  end

  def update
    @watchlist_item = WatchlistItem.find(params[:id])

    @watchlist_item.user_id = params[:user_id]
    @watchlist_item.movie_id = params[:movie_id]
    @watchlist_item.watched = params[:watched]

    if @watchlist_item.save
      redirect_to watchlist_item_url(@watchlist_item.id), :notice => "Watchlist item updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @watchlist_item = WatchlistItem.find(params[:id])

    @watchlist_item.destroy

    redirect_to watchlist_items_url, :notice => "Watchlist item deleted."
  end
end
