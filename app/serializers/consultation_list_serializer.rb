class ConsultationListSerializer < ConsultationSerializer
  attributes :id, :last_comment

  def last_comment
    object.comments.order('created_at ASC').last(3)
  end
end
