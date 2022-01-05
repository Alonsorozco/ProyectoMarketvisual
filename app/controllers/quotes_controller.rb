class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show destroy edit update destroy  ]

  def index
    @user_quotes = current_user.quotes
  end

  def show
    @message = Message.new
    @messages = Message.where(publication: Publication.find(@quote.publication.id) )
    # @messages = Message.joins(:quote).where("messages.user_id = ? ", current_user.id).where("messages.user_id = ? ",@quote.user.id).where("quotes.publication_id = ?", @quote.publication.id)
  end

  def new
   @quote = Quote.new  
  end

  def create
    @quote = Quote.new(quote_params)  
    @quote.user_id= current_user.id
    @quote.publication_id = params[:quote][:publication_id]
    respond_to do |format|
      if @quote.save!
        format.html { redirect_to profile_path(current_user.id),notice: "Felicitacion has cotizado" }
        format.json { render :index, status: :created, location: @quote}
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to profile_path(current_user.id), notice: "Tu cotizacion fue actualizada"}
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end

  end



  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.id), notice: "Cancelaste una cotizacion." }
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
