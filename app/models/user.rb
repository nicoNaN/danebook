class User < ActiveRecord::Base
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :first_name, :last_name, length: { in: 3..24 }

  has_secure_password
  validates :password, length: { in: 8..24 }, allow_nil: true
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
end
