class Comment < ApplicationRecord
belongs_to :user
belongs_to :consultation, counter_cache: true
has_many :likes, :as => :likable, dependent: :destroy
validates :body, presence: true,length: { maximum: 5000 }
end
