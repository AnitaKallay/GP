class Comment < ApplicationRecord
belongs_to :user
belongs_to :consultation, counter_cache: true
validates :body, presence: true,length: { maximum: 5000 }
end
