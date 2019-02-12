class CommentsController < ApplicationController
	before_action :my_thread_find
	before_action :comment_find, only: [:edit, :update, :destroy]
	

	def create
		@my_thread = MyThread.find(params[:my_thread_id])
		@my_thread.comments.create(comment_params)
		redirect_to my_thread_path(@my_thread)
	end

	def edit
	end

	def update
		@comment.update(comment_params)
		redirect_to my_thread_path(@my_thread)
	end

	def destroy
		@comment.destroy
		redirect_to my_thread_path(@my_thread)
	end

	private
		def comment_params
			params.require(:comment).permit(:body)
		end

		def my_thread_find
			@my_thread = MyThread.find(params[:my_thread_id])
		end

		def comment_find
			@comment = @my_thread.comments.find(params[:id])
		end
end
