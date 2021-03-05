class ReplySerializer < ActiveModel::Serializer
  attributes :id,
             :body,
             :comment_id,
             :user_id,
             :likes_count,
             :is_liked


  def initialize(object, user)
    @current_user = user
     super(object, user)
  end

  def is_liked
    object.likes.where(user_id: @current_user.id).present?
  end

end
