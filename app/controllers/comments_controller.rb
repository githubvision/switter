class CommentsController < ApplicationController
	before_action :require_login
	
	def show
		@swit = Swit.find(params[:swit_id])
		respond_to do |format|
			format.js
		end
	end

	def create
		@swit = Swit.find(params[:swit_id])
		@comment = @swit.comments.create(user_id: session[:user_id], content: params[:comment][:content])
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
