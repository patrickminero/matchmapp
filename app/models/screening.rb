class Screening < ApplicationRecord
  belongs_to :match
  belongs_to :bar
  has_one :chatroom
  after_create :assign_chatroom

  private

  def assign_chatroom
    self.chatroom = Chatroom.create(name: "#{self.match.name} - #{self.bar.name}")
  end
end
