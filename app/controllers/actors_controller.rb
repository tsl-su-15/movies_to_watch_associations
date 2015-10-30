class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)

    if @actor.save
      redirect_to actors_url, :notice => "Actor created successfully."
    else
      render 'new'
    end
  end

  def edit
    @actor = Actor.find(params[:id])
  end

  def update
    @actor = Actor.find(params[:id])

    if @actor.update_attributes(actor_params)
      redirect_to actor_url(@actor.id), :notice => "Actor updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy

    redirect_to actors_url, :notice => "Actor deleted."
  end

  def actor_params
    params.require(:actor).permit(:name, :image_url, :bio, :dob)
  end
end
