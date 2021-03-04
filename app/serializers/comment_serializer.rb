class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :consultation_id, :user_id, :owner, :comment_likes

  def owner
   "#{object.user.first_name} #{object.user.last_name}"
  end
  def comment_likes
      object.likes.length
  end
end
