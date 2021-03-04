class Api::V1::LikesController < ApplicationController
before_action :authenticate
before_action :find_comment, only: [:create_comment_likes, :destroy_comment_likes]
  def create_comment_likes
   @like = Like.new(user_id: @current_user.id, likable: @comment)
    if @like.save
      render json: {count: @comment.likes.count}
    else
      render json: {error_message: @like.errors.full_messages}
    end
  end

   def destroy_comment_likes
    @like = Like.find_by(user_id: @current_user.id, likable: @comment)
     if @like.present?
       @like.destroy
        render json: {count: @comment.likes.count}
     else
        render json: {error_message: @like.errors.full_messages}
     end
   end

private

   def find_comment
    @comment = Comment.find_by(id: params[:id])
     if @comment.nil?
      render json: {error_message: @comment.errors.full_messages}
     end
   end
end
