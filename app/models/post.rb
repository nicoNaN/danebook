class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likable

  def author
    User.find(self.user.id)
  end
end
