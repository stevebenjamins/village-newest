class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :timeoutable, :timeout_in => 7.days

  acts_as_voter
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name   # assuming the user model has a name
      user.profile_picture = auth.info.image # assuming the user model has an image
      user.writer = false
      user.admin = false
    end
  end

  def remember_me
    true
  end
  
end
