class HomeController < ApplicationController
	before_action :require_login

	def index
		@user = User.find(session[:user_id])
		@swits = Swit.all.order('created_at DESC')
		@swit = Swit.new
		@comment = Comment.new
	end

	def destroy
		session[:user_id] = nil;
		redirect_to login_index_path
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
