class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  enum status: [:pending, :accepted, :rejected]
end
