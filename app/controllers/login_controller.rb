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
		respond_to do |format|
			if params[:login][:username] == nil && params[:login][:password] == nil
				@error = "Please enter username and password."
				format.js
			else
				if params[:login][:username] == nil
					@error = "Please enter username."
					format.js
				else 
					if params[:login][:password] == nil
						@error = "Please enter password."
						format.js
					else
						user = User.find_by(username: params[:login][:username])
						if user != nil
						 	if user.password == params[:login][:password]
								session[:user_id] = user.id
								@error = "false"
								format.js
							else
								@error = "Password did not match username."
								format.js
							end
						else
							@error = "No user found."
							format.js
						end
					end
				end
			end
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