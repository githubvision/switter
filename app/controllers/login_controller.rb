class LoginController < ApplicationController
	before_action :check_session

	def index
		@users = User.all
		@user = User.new
	end

	def new
		@user = User.new
	end

	def create
		user = User.find_by(username: params[:login][:username])
		if user && user.password == params[:login][:password]
			session[:user_id] = user.id
			redirect_to home_index_path
		else 
			redirect_to login_index_path
		end
	end

	def show
		
	end

	private
	def check_session
		if session[:user_id]
			redirect_to home_index_path
		end
	end
end