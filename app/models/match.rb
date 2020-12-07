class Match < ApplicationRecord
  has_many :screenings, dependent: :destroy
  has_many :bars, through: :screenings
end
