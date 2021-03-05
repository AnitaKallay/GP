class Api::V1::LikesController < ApplicationController
before_action :authenticate
before_action :find_comment, only: [:comment_likes]
before_action :find_consultation, only: [:consultation_likes]
before_action :find_reply, only: [:reply_likes]

   def comment_likes
      @like = Like.find_by(user_id: @current_user.id, likable: @comment)
       if @like.present?
          @like.destroy
           render json:{ count: @comment.likes.count, message: "Dislike"}
       else
          @like = Like.new(user_id: @current_user.id, likable: @comment)
         if @like.save
           render json:{ count: @comment.likes.count, message: "Is liked"}
         else
           render json:{ errors: @like.errors.messages }
         end
       end
   end

   def consultation_likes
     @like = Like.find_by(user_id: @current_user.id, likable: @consultation)
      if @like.present?
         @like.destroy
          render json:{ count: @consultation.likes.count, message: "Dislike"}
      else
         @like = Like.new(user_id: @current_user.id, likable: @consultation)
        if @like.save
          render json:{ count: @consultation.likes.count, message: "Is liked"}
        else
          render json:{ errors: @like.errors.messages }
        end
      end
   end

   def reply_likes
     @like = Like.find_by(user_id: @current_user.id, likable: @reply)
      if @like.present?
         @like.destroy
          render json:{ count: @reply.likes.count, message: "Dislike"}
      else
         @like = Like.new(user_id: @current_user.id, likable: @reply)
        if @like.save
          render json:{ count: @reply.likes.count, message: "Is liked"}
        else
          render json:{ errors: @like.errors.messages }
        end
      end
   end


private

   def find_comment
    @comment = Comment.find_by(id: params[:id])
     if @comment.nil?
      render json: {error_message: "Not found"}
     end
   end

   def find_consultation
     @consultation = Consultation.find_by(id: params[:id])
     if @consultation.nil?
        render json: { error_message: "Not found"}
     end
   end
   def find_reply
     @reply = Reply.find_by(id: params[:id])
     if @reply.nil?
        render json: { error_message: "Not found"}
     end
   end

end
