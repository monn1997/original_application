class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable, :confirmable
  
  validates :name, presence: true       
  has_many :assigns, dependent: :destroy
  has_many :assign_teams, through: :assigns, source: :team
  has_many :business_performances, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :salalies, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest10@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー(一般)"
    end
  end

  def self.admin_guest
    find_or_create_by!(email: 'admin_guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.admin = true
      user.name = "ゲストユーザー(管理者)"
    end
  end


end
