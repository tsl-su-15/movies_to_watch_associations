class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html { render 'index'}
      format.json { render json: @movies }
    end
  end

  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html { render 'show'}
      format.json { render json: @movie }
    end
  end
end
