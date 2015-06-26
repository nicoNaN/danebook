class Profile < ActiveRecord::Base
  belongs_to :user

  validates :phone_number,
            numericality: true,
            length: { minimum: 10, maximum: 15 }
end
