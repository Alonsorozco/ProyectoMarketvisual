class ComentsController < ApplicationController
    before_action :set_coment, only: %i[ show edit update destroy  ]


    def index
        @coments = Coment.all
    end


    def show
    end


    def new
        @coment = Coment.new
    end

    def edit
    end


    def create
        @coment = Coment.new(coment_params)

        respond_to do |format|
        if @coment.save
            format.html { redirect_to @coment, notice: "Comentarios se ha creado" }
            format.json { render :show, status: :created, location: @coment }
        else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @coment.errors, status: :unprocessable_entity }
        end
        end
    end

    # PATCH/PUT /games/1 or /games/1.json
    def update
        respond_to do |format|
        if @coment.update(coment_params)
            format.html { redirect_to @coment, notice: "Comentarios se ha creado" }
            format.json { render :show, status: :ok, location: @coment }
        else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @coment.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy
        @coment.destroy
        respond_to do |format|
        format.html { redirect_to root_path, notice: "" }
        format.json { head :no_content }
        end
    end

    private

        def set_coment
        @coment = Coment.find(params[:id])
        end


        def coment_params
        params.require(:coment).permit(:content )
    end
end
