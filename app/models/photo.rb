class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable
  
  has_attached_file :data
  validates_attachment_content_type :data, content_type: /\Aimage\/.*\Z/
end
