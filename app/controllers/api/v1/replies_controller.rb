class Api::V1::RepliesController < ApplicationController
before_action :authenticate
before_action :find_comment
before_action :find_reply, only: [:destroy, :update]
  def index
    @replies = @comment.replies
      render json: { replies: @replies.map{|item| ReplySerializer.new(item, @current_user)}}
  end

  def create
    @reply = Reply.new(reply_params)
    if @reply.save
      render json: {reply: ReplySerializer.new(@reply, @current_user)}
    else
      render json: {error_message: @reply.errors.full_messages}
    end
  end

  def destroy
   authorize @reply
    if @reply.destroy
      render json: {message: "Reply is deleted"}
    end
  end

  def update
    authorize @reply
     if @reply.update(reply_update_params)
       render json: {comment: ReplySerializer.new(@reply, @current_user)}
     else
       render json: {message: "Reply is not updeted"}
     end
   end



  private

  def reply_params
    params.require(:reply).permit(:body).merge(comment_id: @comment.id, user_id: @current_user.id)
  end

  def reply_update_params
    params.require(:reply).permit(:body)
  end

  def find_comment
    @comment = Comment.find_by(id: params[:id])
     if @comment.nil?
       render json: { error_message: "Comment is not found"}
    end
  end
  def find_reply
    @reply = Reply.find_by(id: params[:id])
     if @reply.nil?
       render json: { error_message: "Reply is not found"}
    end
  end

end
