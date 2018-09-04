class Booking < ApplicationRecord
  belongs_to :guest, foreign_key: :guest_id, class_name: 'User'
  belongs_to :room
  has_one :hotel, through: :room
end
