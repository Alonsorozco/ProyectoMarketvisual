class HomesController < ApplicationController

 

  def index
  @publications = Publication.all.order(created_at: :desc)
  end



  def publication_params
    params.require(:publication).permit(:title, :description, :value, :image)
  end

end
