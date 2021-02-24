class UserListSerializer < UserSerializer
  attributes :last_consultation

  def last_consultation
    object.consultation.order('created_at ASC').last
  end
end
