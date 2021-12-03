class QuotesController < ApplicationController
  before_action :set_user, only: %i[ show  ]

  def index
    @user_quotes = current_user.quotes
  end

  def show
  end


  private
  def set_user
    @quote = Quote.find(params[:id])
  end

  def user_params
    params.require(:quote).permit(:date, :phone, :message)
  end

end
