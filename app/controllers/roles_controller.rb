class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new
    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]
    @role.character_name = params[:character_name]

    if @role.save
      redirect_to roles_url, :notice => "Role created successfully."
    else
      render 'new'
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])

    @role.actor_id = params[:actor_id]
    @role.movie_id = params[:movie_id]
    @role.character_name = params[:character_name]

    if @role.save
      redirect_to role_url(@role.id), :notice => "Role updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @role = Role.find(params[:id])

    @role.destroy

    redirect_to roles_url, :notice => "Role deleted."
  end
end
