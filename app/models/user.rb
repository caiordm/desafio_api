class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  mount_uploader :avatar, AvatarUploader
  before_create :generate_confirmation_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  private

  def generate_confirmation_token
    self.confirmation_token = SecureRandom.urlsafe_base64.to_s
    self.confirmation_sent_at = Time.now.utc
  end
end
