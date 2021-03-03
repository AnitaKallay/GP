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
             :user



  def initialize(object, user)
     @current_user = user
     super(object, user)
  end

  def owner
   "#{object.user.first_name} #{object.user.last_name}"
  end

  def comments_count
    object.comments.count
  end
  def is_comment
    object.comments.where(user: @current_user).present?
  end

end
