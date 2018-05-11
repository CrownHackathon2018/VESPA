class ViksController < ApplicationController
  before_action :set_vik, only: [:show, :edit, :update, :destroy]

  # GET /viks
  # GET /viks.json
  def index
    @viks = Vik.all
  end

  # GET /viks/1
  # GET /viks/1.json
  def show
  end

  # GET /viks/new
  def new
    @vik = Vik.new
  end

  # GET /viks/1/edit
  def edit
  end

  # POST /viks
  # POST /viks.json
  def create
    @vik = Vik.new(vik_params)

    respond_to do |format|
      if @vik.save
        format.html { redirect_to @vik, notice: 'Vik was successfully created.' }
        format.json { render :show, status: :created, location: @vik }
      else
        format.html { render :new }
        format.json { render json: @vik.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viks/1
  # PATCH/PUT /viks/1.json
  def update
    respond_to do |format|
      if @vik.update(vik_params)
        format.html { redirect_to @vik, notice: 'Vik was successfully updated.' }
        format.json { render :show, status: :ok, location: @vik }
      else
        format.html { render :edit }
        format.json { render json: @vik.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viks/1
  # DELETE /viks/1.json
  def destroy
    @vik.destroy
    respond_to do |format|
      format.html { redirect_to viks_url, notice: 'Vik was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vik
      @vik = Vik.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vik_params
      params.require(:vik).permit(:name, :location)
    end
end
