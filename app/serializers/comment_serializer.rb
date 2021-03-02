class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :consultation_id, :user_id, :owner

  def owner
   "#{object.user.first_name} #{object.user.last_name}"
  end
end
