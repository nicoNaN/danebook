class Comment < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :user
  has_one :post
  has_one :photo
  has_many :likes, as: :likable
end
