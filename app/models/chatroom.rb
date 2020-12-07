class Chatroom < ApplicationRecord
  belongs_to :screening
  has_many :messages, dependent: :destroy
end
