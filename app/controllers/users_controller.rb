class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    respond_to do |format|
      @user = User.new(user_params)
      if @user.password.length < 8
        @error = "A password must be at least 8 characters."
        format.js
      else
        if @user.save
          session[:user_id] = @user.id
          @error = "false"
          format.js
        else
          @error = "Please fill up all the fields."
          format.js
        end
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update    
    @user.update(user_params)
    if @user.save
      redirect_to profile_path(:id => @user.id, :error => false, :error_message => 0)
    else
      if @user.password.length < 8
        redirect_to profile_path(:id => @user.id, :error => true, :error_message => 1)
      else
        redirect_to profile_path(:id => @user.id, :error => true, :error_message => 2)
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :email, :birthday, :bio, :first_name, :last_name)
    end

    def require_login
      if session[:user_id]
        @user = User.find_by(id: session[:user_id])
      else
        redirect_to login_index_path
      end
    end
end
