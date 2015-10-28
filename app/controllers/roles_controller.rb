class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)

    if @role.save
      redirect_to roles_url, :notice => "Role created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @role.update_attributes(role_params)
      redirect_to role_url(@role.id), :notice => "Role updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @role.destroy

    redirect_to roles_url, :notice => "Role deleted."
  end

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:actor_id, :movie_id, :character_name)
  end
end
