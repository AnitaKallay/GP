class Api::V1::CommentsController < ApplicationController
before_action :authenticate
before_action :find_consultation, only: [:create]
before_action :find_comment, only: [:update, :destroy]
  def index
    @pagy, @comments = pagy(Comment.all)
      render json: { comments: @comments.map{|item| CommentSerializer.new(item, @current_user)},total_page: @pagy.page}
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: {comment: CommentSerializer.new(@comment, @current_user)}
    else
      render json: {error_message: @comment.errors.full_messages}
    end
  end

  def destroy
   authorize @comment
    if @comment.destroy
      render json: {message: "Comment is deleted"}
    end
  end

  def update
    authorize @comment
     if @comment.update(comment_update_params)
       render json: {comment: CommentSerializer.new(@comment, @current_user)}
     else
       render json: {message: "Comment is not updeted"}
     end
   end

  private

    def comment_params
      params.require(:comment).permit(:body).merge(consultation_id: @consultation.id, user_id: @current_user.id)
    end

    def comment_update_params
      params.require(:comment).permit(:body)
    end

    def find_consultation
     @consultation = Consultation.find_by(id: params[:consultation_id])
      if @consultation.nil?
         render json: { error_message: "Consultation is not found"}
      end
    end

    def find_comment
      @comment = Comment.find_by(id: params[:id])
       if @comment.nil?
         render json: { error_message: "Comment is not found"}
      end
    end
end
