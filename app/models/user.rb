class User < ApplicationRecord
include UserConcern
  extend Enumerize
  after_create:send_email
  after_initialize :set_defaults
  has_secure_password
  has_secure_token :auth_token
  has_secure_token :reset_password_token
  has_secure_token :confirm_token
  has_many :tokens
  mount_uploader :avatar, AvatarUploader

  validates :role, presence: true
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :password, format: PASSWORD_REQUIREMENTS, allow_blank: true
  validates :password_confirmation, presence: true, allow_blank: true
  validates :IMC, presence: true
  validates :country, presence: true
  validates :user_types, presence: true
  validates :county,  presence: true, if: :ireland?
  validates :gp_type, presence: true, if: :gp?
  validates :practice_name, presence: true, if: :gp?

  enumerize :gp_type, in: USER_GP_TYPES, predicates: true
  enumerize :country, in: USER_COUNTRIES, predicates: true
  enumerize :county, in: USER_COUNTIES, predicates: true
  enumerize :role, in: USER_ROLES, predicates: true
  enumerize :user_types, in: USER_TYPES, predicates: true




end
