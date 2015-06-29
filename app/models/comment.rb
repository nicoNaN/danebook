class Comment < ActiveRecord::Base
  belongs_to :user
  has_one :post
  has_many :likes, as: :likable
end
