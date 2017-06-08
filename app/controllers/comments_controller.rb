class CommentsController < ApplicationController
	def create
		@swit = Swit.find(params[:swit_id])

		@comment = @swit.comments.create(comment_params)
		redirect_to swit_path
	end

	private
		def comment_params
			params.require(:comment).permit(:commenter_id, :comment_body)
		end
end
