class CommentSerializer < ActiveModel::Serializer
  attributes :id,
             :body,
             :consultation_id,
             :user_id,
             :owner,
             :likes_count,
             :is_liked

  def initialize(object, user)
    @current_user = user
     super(object, user)
  end

  def owner
   "#{object.user.first_name} #{object.user.last_name}"
  end

  def is_liked
    object.likes.where(user_id: @current_user.id).present?
  end
end
