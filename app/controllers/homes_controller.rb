class HomesController < ApplicationController

 

  def index
    @q = params[:q]
    if @q
      @publications = Publication.where('title LIKE ?', "%#{params[:q]}%").order(created_at: :desc)
    else
      @publications= Publication.all.order(created_at: :desc)
    end
  # @publications = Publication.all.order(created_at: :desc)
  end



  def publication_params
    params.require(:publication).permit(:title, :description, :value, :image)
  end

end
