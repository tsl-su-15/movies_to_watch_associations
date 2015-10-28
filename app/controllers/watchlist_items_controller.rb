class WatchlistItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_watchlist_item, only: [:show, :edit, :update, :destroy, :check_if_owner]
  before_action :check_if_owner, only: [:show, :edit, :update, :destroy]

  def index
    @watchlist_items = WatchlistItem.all
  end

  def show
  end

  def new
    @watchlist_item = WatchlistItem.new
  end

  def create
    @watchlist_item = WatchlistItem.new
    @watchlist_item.user_id = params[:user_id]
    @watchlist_item.movie_id = params[:movie_id]

    if @watchlist_item.save
      redirect_to movies_url, :notice => "Watchlist item created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
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
    @watchlist_item.destroy

    redirect_to :back, :notice => "Watchlist item deleted."
  end

  def set_watchlist_item
    @watchlist_item = WatchlistItem.find(params[:id])
  end

  def check_if_owner
    if current_user.id != @watchlist_item.user_id
      redirect_to root_url, notice: "You must be the owner to do that"
    end
  end
end
