class ConsultationSerializer < ActiveModel::Serializer
  attributes :id,
             :user_id,
             :disclaimer,
             :title,
             :history,
             :exam,
             :impression,
             :plan,
             :additional_info,
             :broshure,
             :created_at,
             :updated_at,
             :owner,
             :comments,
             :comments_count,
             :is_comment
  def owner
   "#{object.user.first_name} #{object.user.last_name}"
  end

  def comments
    object.comments
  end
  def comments_count
    object.comments.length
  end
  def is_comment
    object.comments.present?
  end

end
