class SwitsController < ApplicationController
  before_action :set_swit, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /swits
  # GET /swits.json

  def index
    @swits = Swit.where('post LIKE ?', "%#{params[:to_match]}%")
  end

  # GET /swits/1
  # GET /swits/1.json
  def show
    @swit = Swit.find(params[:id])
    
    respond_to do |format|
      format.js
    end
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
        format.js
      else
        redirect_to controller: 'profile', action: 'show', id: session[:user_id]
      end
    end
  end

  # PATCH/PUT /swits/1
  # PATCH/PUT /swits/1.json
  def update
    @swit = Swit.find(params[:id])
    respond_to do |format|
      if params[:mode] == 'sweet'
        
        if @swit.sweets.where("sweeter_id = ?", session[:user_id]).empty?
          @swit.sweets.create(:sweeter_id => session[:user_id])
        else
          @swit.sweets.where(:sweeter_id => session[:user_id]).destroy_all
        end
        format.js

      else
        
        if @swit.sours.where("sourer_id = ?", session[:user_id]).empty?
          @swit.sours.create(:sourer_id => session[:user_id])
        else
          @swit.sours.where(:sourer_id => session[:user_id]).destroy_all
        end
        format.js

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

    def sweet_params
      params.require(:sweet).permit(:sweeter_id)
    end

    def sour_params
      params.require(:sour).permit(:sourer_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swit_params
      params.require(:swit).permit(:post, :sweets_count, :sours_count, :user_id)
    end

    def require_login
      if session[:user_id]
        @user = User.find_by(id: session[:user_id])
      else
        redirect_to login_index_path
      end
    end
end
