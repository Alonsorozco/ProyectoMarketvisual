class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update ]

  def new
  end

  def show
    @user_quotes = current_user.quotes
    @user_publications = current_user.publications
  end

  def edit
  end

  def update
    respond_to do |format|
        if @user.update(user_params)
            format.js { render nothing: true, notice: 'El bookmark se ha actualizado!' }
        else
            format.html { redirect_to edit_user_path, notice: 'El bookmark no se ha actualizado' }
        end
    end
  end

  def create
  end



  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :lastname, :quote, :publisher)
  end
end
