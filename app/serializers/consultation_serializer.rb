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
             :comments_count,
             :is_comment,
             :user,
             :likes_count



  def initialize(object, user)
     @current_user = user
     super(object, user)
  end

  def owner
   "#{object.user.first_name} #{object.user.last_name}"
  end

  def is_comment
    object.comments.where(user_id: @current_user.id).present?
  end

end
