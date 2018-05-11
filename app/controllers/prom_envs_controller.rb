class PromEnvsController < ApplicationController
  before_action :set_prom_env, only: [:show, :edit, :update, :destroy]

  # GET /prom_envs
  # GET /prom_envs.json
  def index
    @prom_envs = PromEnv.all
  end

  # GET /prom_envs/1
  # GET /prom_envs/1.json
  def show
  end

  # GET /prom_envs/new
  def new
    @prom_env = PromEnv.new
  end

  # GET /prom_envs/1/edit
  def edit
  end

  # POST /prom_envs
  # POST /prom_envs.json
  def create
    @prom_env = PromEnv.new(prom_env_params)

    respond_to do |format|
      if @prom_env.save
        format.html { redirect_to @prom_env, notice: 'Prom env was successfully created.' }
        format.json { render :show, status: :created, location: @prom_env }
      else
        format.html { render :new }
        format.json { render json: @prom_env.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prom_envs/1
  # PATCH/PUT /prom_envs/1.json
  def update
    respond_to do |format|
      if @prom_env.update(prom_env_params)
        format.html { redirect_to @prom_env, notice: 'Prom env was successfully updated.' }
        format.json { render :show, status: :ok, location: @prom_env }
      else
        format.html { render :edit }
        format.json { render json: @prom_env.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prom_envs/1
  # DELETE /prom_envs/1.json
  def destroy
    @prom_env.destroy
    respond_to do |format|
      format.html { redirect_to prom_envs_url, notice: 'Prom env was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prom_env
      @prom_env = PromEnv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prom_env_params
      params.require(:prom_env).permit(:environment, :description)
    end
end
