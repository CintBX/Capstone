class RepliesController < ApplicationController
	before_action :set_reply, only: [:edit, :update, :show, :destroy]
	before_action :set_discussion, only: [:create, :edit, :update, :show, :update, :destroy]

	def create
		@reply = @discussion.replies.create(params[:reply].permit(:reply, :discussion_id))
		@reply.user_id = current_user.id

		respond_to do |format|
			if @reply.save
				format.html { redirect_to discussion_path(@discussion) }
				format.js # render create.js.erb
			else
				format.html { redirect_to discussion_path(@discussion), notice: "Reply did not save.  Please try again."}
				format.js
			end
		end
	end

	def new
	end

	def destroy
		@reply = @discussion.replies.find(params[:id])
		@reply.destroy
		redirect_to discussion_path(@discussion)
	end

	def edit
		if has_role?(:admin) || reply_author(@reply)
			@discussion = Discussion.find(params[:discussion_id])
			@reply = @discussion.replies.find(params[:id])
		else
			redirect_to @discussion, notice: "You are not authorized to perform this action."
		end
	end

	def update
		@reply = @discussion.replies.find(params[:id])
		respond_to do |format|
			if @reply.update(reply_params)
				format.html { redirect_to discussion_path(@discussion), notice: "Your reply was updated successfully." }
			else
				format.html { render :edit }
				format.json { render json: @reply.errors, status: :unprocessable_entity }
			end
		end
	end

	private

	def set_discussion
		@discussion = Discussion.find(params[:discussion_id])
	end

	def set_reply
		@reply = Reply.find(params[:id])
	end

	def reply_params
		params.require(:reply).permit(:reply)
	end
end