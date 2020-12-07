class Bar < ApplicationRecord
  has_many :screenings, dependent: :destroy
  has_many :matches, through: :screenings
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  enum status: [:many_spaces, :few_spaces, :no_spaces]
  enum category: BAR_CATEGORIES
  has_many_attached :photos
end
