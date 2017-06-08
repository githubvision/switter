class ProfileController < ApplicationController
	def index
		@user = User.find(session[:user_id])
		@swits = User.find_by(id: session[:user_id]).swits.order('created_at DESC')
		@swit = Swit.new
	end

	def show
		@user = User.find(params[:id])
		@swits = User.find(params[:id]).swits.order('created_at DESC')
		@swit = Swit.new
	end	

end
