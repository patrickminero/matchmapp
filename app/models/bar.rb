class Bar < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :screenings, dependent: :destroy
  has_many :matches, through: :screenings
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  enum status: [:many_spaces, :few_spaces, :no_spaces]
  enum category: BAR_CATEGORIES
  has_many_attached :photos

  def rating
    return 0 if self.reviews.empty?

    total = self.reviews.sum(:rating)
    total / self.reviews.count
  end

  def color_vote(color)
    if color == 'green'
      self.green_votes += 1
    elsif color == 'yellow'
      self.yellow_votes += 1
    elsif color == 'red'
      self.red_votes += 1
    end
    self.calculate_status
    save
  end

  def calculate_status
    if self.yellow_votes == self.green_votes + 2
      self.status = 1
    elsif self.red_votes == self.yellow_votes + 2
      self.status = 2
    end
    save
  end
end
