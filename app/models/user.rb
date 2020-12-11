class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :create_profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  has_many :bookings
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy


  def create_profile
    @profile = Profile.new
    @user = User.last
    @profile.user_id = @user.id
    @profile.save
  end
end


