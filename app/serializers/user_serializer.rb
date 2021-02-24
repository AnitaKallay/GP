class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :first_name,
             :last_name,
             :email,
             :role,
             :avatar,
             :imc,
             :gp_type,
             :practice_name,
             :county,
             :country,
             :user_types

  def full_name
    "#{object.name} #{object.last_name}"
  end

end
