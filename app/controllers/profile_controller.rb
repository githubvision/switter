class ProfileController < ApplicationController
	before_action :require_login

	def index
		@user = User.find(session[:user_id])
		@swits = User.find_by(id: session[:user_id]).swits.order('created_at DESC')
		@comment = Comment.new
		@swit = Swit.new
	end

	def show
		@error = params[:error]
		@error_message = params[:error_message]
		
		if @error_message == "1"
			@error_message = "Password must be at least 8 characters."
		elsif @error_message == "2"
			@error_message = "Please fill-up all the fields."
		else
			@error_message = nil
		end
		
		@user = User.find(params[:id])
		@swits = User.find(params[:id]).swits.order('created_at DESC')
		@swit = Swit.new
		@comment = Comment.new
		@newuser = User.new
	end	

	def edit
		@user = User.find(params[:id])
		respond_to do |format|
			format.js
		end
	end

	private
	def require_login
		if session[:user_id]
			@user = User.find_by(id: session[:user_id])
		else
			redirect_to login_index_path
		end
	end
end
