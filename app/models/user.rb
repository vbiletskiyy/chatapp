class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages
  scope :except_me, ->(user) { where.not(id: user.id) }

  def username
    self.email.split("@")[0]
  end
end
