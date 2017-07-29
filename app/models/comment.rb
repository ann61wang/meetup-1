class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :weetup

  validates :content, presence: true
end
