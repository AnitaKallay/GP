class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :full_name,
             :email,
             :role,
             :avatar,
             :imc,
             :gp_type,
             :practice_name,
             :county,
             :country,
             :auth_token
             :user_types

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

end
