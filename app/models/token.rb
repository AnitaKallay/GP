class Token < ApplicationRecord
  belongs_to :user
  has_secure_token :auth_token
end
