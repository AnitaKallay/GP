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
             :owner
  def owner
   "#{object.user.first_name} #{object.user.last_name}"
  end
end
