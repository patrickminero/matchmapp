class Match < ApplicationRecord
  has_many :screenings, dependent: :destroy
  has_many :bars, through: :screenings

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [ :home_team, :away_team ],
    associated_against: {
      bars: [ :name, :category ]
  },
    using: {
      tsearch: { prefix: true }
  }
end
