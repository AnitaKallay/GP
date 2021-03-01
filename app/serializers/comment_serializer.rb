class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :consultation_id, :user_id
end
