class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create :welcome_send

  has_one_attached :avatar
  has_many :events 
  has_many :participations
  has_many :participated_events, through: :participations, source: :event

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

end
