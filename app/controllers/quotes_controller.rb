class QuotesController < ApplicationController
  before_action :set_user, only: %i[ show destroy  ]

  def index
    @user_quotes = current_user.quotes
  end

  def show
  end

  def def create
    @quotes.publication_id = current_user
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.id), notice: "cancelaste una cotizacion." }
      format.json { head :no_content }
    end
  end

  private
  def set_user
    @quote = Quote.find(params[:id])
  end

  def user_params
    params.require(:quote).permit(:date, :phone, :message)
  end

end
