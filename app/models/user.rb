class User < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, :last_name, length: { in: 3..24 }
  validates :gender, :birthday, presence: true
  validates :password, length: { in: 8..24 }, allow_nil: true

  has_one :profile, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :friendships
  has_many :photos
  has_many :friends, through: :friendships
  accepts_nested_attributes_for :profile

  has_secure_password
  before_create :generate_token

  def generate_token
    begin
      self[:auth_token] = SecureRandom.urlsafe_base64
    end while User.exists?(auth_token: self[:auth_token])
  end

  def regenerate_auth_token
    self.auth_token = nil
    generate_token
    save!
  end

  def self.search(term)
    if term
      User.where("first_name LIKE ? OR last_name LIKE ?", "%#{term}%", "%#{term}%")
    else
      User.all
    end
  end

  def friend_posts_recent
    posts = []
    self.friends.each do |friend|
      friend.posts.each do |post|
        posts << post
      end
    end
    posts = posts.to_a.sort_by &:created_at
    posts.last(10).reverse
  end

  def friend_posts_all
    posts = []
    self.friends.each do |friend|
      friend.posts.each do |post|
        posts << post
      end
    end
    posts = posts.to_a.sort_by &:created_at
    posts.reverse
  end

  def full_name
    first_name + ' ' + last_name
  end

  def formatted_birthday
    birthday.strftime("%B #{birthday.day.ordinalize}, %Y")
  end
  
  private

  def self.send_welcome_email(user)
    UserMailer.welcome(user).deliver
  end
end
