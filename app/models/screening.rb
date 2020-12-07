class Screening < ApplicationRecord
  belongs_to :match
  belongs_to :bar
end
