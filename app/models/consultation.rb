class Consultation < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, :as => :likable, dependent: :destroy
  validates :disclaimer, presence: true
  validates :title, presence: true
  validates :history, presence: true
  validates :exam, presence: true
  validates :impression, presence: true
  validates :plan, presence: true
  validates :additional_info, presence: true
  validates :broshure, presence: true

  mount_uploader :broshure, BroshureUploader
end
