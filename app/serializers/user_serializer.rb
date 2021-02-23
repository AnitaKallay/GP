class UserSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :user_types, :county, :consultation

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def consultations
    object.consultations
  end
end
