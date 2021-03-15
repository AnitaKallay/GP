class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  has_many :likes, :as => :likable, dependent: :destroy
  validates :body, presence: true
end
