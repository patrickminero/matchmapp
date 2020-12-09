class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bar
  belongs_to :match
  enum status: [:pending, :accepted, :rejected]
end
