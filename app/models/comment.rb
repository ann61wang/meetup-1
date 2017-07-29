class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :weetup, counter_cache: true

  validates :content, presence: true
  scope :recent, -> {order("created_at DESC")}
end
