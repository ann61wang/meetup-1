class Weetup < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, presence: true
  scope :recent, -> {order("created_at DESC")}
end
