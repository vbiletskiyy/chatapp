class Room < ApplicationRecord
  validates_uniqueness_of :name
  after_create_commit :broadcast_room
  has_many :messages
  has_many :participants

  scope :not_private, -> { where(is_private: false) }

  def self.create_private_room(users, room_name)
    single_room = Room.create(name: room_name, is_private: true)
    users.each do |user|
      Participant.create(user_id: user.id, room_id: single_room.id)
    end
    single_room
  end

  def broadcast_room
    broadcast_append_to "rooms" unless is_private?
  end

end
