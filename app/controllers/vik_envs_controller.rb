class VikEnvsController < ApplicationController
  before_action :set_vik_env, only: [:show, :edit, :update, :destroy]

  # GET /vik_envs
  # GET /vik_envs.json
  def index
    @vik_envs = VikEnv.all
  end

  # GET /vik_envs/1
  # GET /vik_envs/1.json
  def show
  end

  # GET /vik_envs/new
  def new
    @vik_env = VikEnv.new
  end

  # GET /vik_envs/1/edit
  def edit
  end

  # POST /vik_envs
  # POST /vik_envs.json
  def create
    @vik_env = VikEnv.new(vik_env_params)

    respond_to do |format|
      if @vik_env.save
        format.html { redirect_to @vik_env, notice: 'Vik env was successfully created.' }
        format.json { render :show, status: :created, location: @vik_env }
      else
        format.html { render :new }
        format.json { render json: @vik_env.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vik_envs/1
  # PATCH/PUT /vik_envs/1.json
  def update
    respond_to do |format|
      if @vik_env.update(vik_env_params)
        format.html { redirect_to @vik_env, notice: 'Vik env was successfully updated.' }
        format.json { render :show, status: :ok, location: @vik_env }
      else
        format.html { render :edit }
        format.json { render json: @vik_env.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vik_envs/1
  # DELETE /vik_envs/1.json
  def destroy
    @vik_env.destroy
    respond_to do |format|
      format.html { redirect_to vik_envs_url, notice: 'Vik env was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vik_env
      @vik_env = VikEnv.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vik_env_params
      params.require(:vik_env).permit(:environment, :description)
    end
end
