class Team < ApplicationRecord
  has_many :assigns, dependent: :destroy
  has_many :members, through: :assigns, source: :user
  validates :name, presence: true, uniqueness: true, length: { maximum: 30 }
  def invite_member(user)
    assigns.create(user: user)
  end  
end
