class CommentListSerializer < CommentSerializer
  attributes :id, :last_replies

  def last_replies
    object.replies.order('created_at ASC')
  end
end
  
