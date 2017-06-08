class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]

  # GET /swits
  # GET /swits.json

  def index
    @swits = Swit.all
  end

  # GET /swits/1
  # GET /swits/1.json
  def show
  end

  # GET /swits/new
  def new
    @swit = Swit.new
  end

  # GET /swits/1/edit
  def edit
  end

  # POST /swits
  # POST /swits.json
  def create
    @swit = Swit.new(swit_params)
    @swit.sweets_count = 0
    @swit.sours_count = 0
    @swit.user_id = session[:user_id]

    respond_to do |format|
      if @swit.save
        format.html { redirect_to profile_index_path, notice: 'Swit was successfully created.' }
        # format.json { render :show, status: :created, location: @swit }
      else
        redirect_to profile_index_path
        # format.html { render :new }
        # format.json { render json: @swit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swits/1
  # PATCH/PUT /swits/1.json
  def update
    @swit = Swit.find(params[:id])

    respond_to do |format|
      if params[:mode] == 'sweet'
        @swit.sweets_count += 1
        @swit.save
        format.html { redirect_to profile_index_path, notice: 'sweets updated' }
      else 
        @swit.sours_count += 1
        @swit.save
        format.html { redirect_to profile_index_path, notice: 'sours updated' }
      end
    end
  end

  # DELETE /swits/1
  # DELETE /swits/1.json
  def destroy
    @swit.destroy
    respond_to do |format|
      format.html { redirect_to swits_url, notice: 'Swit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swit
      @swit = Swit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:post, :sweets_count, :sours_count, :user_id)
    end
end
