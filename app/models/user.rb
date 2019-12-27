# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
   has_one :profile, :dependent => :destroy
   before_create :create_profile
    
  def create_profile
    profile = build_profile(:name => "Person Name", :profile_image => "Person profile",  :contact => "000 000 0000", user_id: current_user)
  end

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?


  def set_default_role
    self.role ||= :user
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end
     devise :database_authenticatable, :registerable,
     :recoverable, :rememberable, :validatable,
     :omniauthable
end
