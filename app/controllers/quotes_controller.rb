class QuotesController < ApplicationController
  before_action :set_user, only: %i[ show  ]

  def index
    @user_quotes = current_user.quotes
  end

  def show
  end

  def def create
    
    @quotes.publication_id = current_user

  end

  private
  def set_user
    @quote = Quote.find(params[:id])
  end

  def user_params
    params.require(:quote).permit(:date, :phone, :message)
  end

end
