class CommentsController < ApplicationController
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
end
