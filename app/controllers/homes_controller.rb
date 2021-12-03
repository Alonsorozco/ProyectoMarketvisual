class HomesController < ApplicationController


  def index
  @publications = Publication.all
  end



end
