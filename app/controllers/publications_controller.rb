class PublicationsController < ApplicationController
  before_action :set_publication, only: %i[ show edit update destroy ]
  
  def index
    @user_publications = current_user.publications
  end

  def edit
  end

  def make_post
    @publication = Publication.new 
  end

  def create

    @publication = Publication.new(publication_params)
    #publicaciones pertenece a un usuario, por que lo necesita un id de usuarios
    #por lo que le pasamos el id del usuario que esta esta creando la publicacion
    #o sea, current_user
    @publication.user = current_user
    respond_to do |format|
      if @publication.save!
        format.html { redirect_to profile_path(current_user.id), notice: "has publicado" }
        format.json { render :index, status: :created, location: @publication }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
    
  end

  def update
    respond_to do |format|
      if @publication.update(publication_params)
        format.html { redirect_to profile_path(current_user.id), notice: "La publicacion fue actualizada"}
        format.json { render :show, status: :ok, location: @publication }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @publication.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(current_user.id), notice: "cancelaste una publicacion." }
      format.json { head :no_content }
    end
  end


  def show
    @publications = Publication.all
    #publicaciones solo del current_user
    @user_publications = current_user.publications
   
   

  end

  private
  def set_publication
    @publication = Publication.find(params[:id])
  end

  def publication_params
    params.require(:publication).permit(:title, :description, :value, images:[] )
  end

end
