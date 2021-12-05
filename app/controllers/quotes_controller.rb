class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show destroy edit update destroy  ]

  def index
    @user_quotes = current_user.quotes
  end

  def show
  end

  def new
   @quote = Quote.new  
  end

  def create
    @quote = Quote.new(quote_params)  
    @quote.user_id= current_user.id
    respond_to do |format|
      if @quote.save!
        format.html { redirect_to quotes_path @quote, notice: "has cotizado" }
        format.json { render :index, status: :created, location: @quote}
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.id), notice: "cancelaste una cotizacion." }
      format.json { head :no_content }
    end
  end

  private
  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:date, :phone, :message)
  end

end
