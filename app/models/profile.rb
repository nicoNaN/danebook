class Profile < ActiveRecord::Base
  belongs_to :user

  validates :phone_number,
            numericality: true,
            length: { in: 10..15 }
end
