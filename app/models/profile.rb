class Profile < ApplicationRecord
  belongs_to :user
  validates_uniqueness_of :user_id, :message => "can only have one Profile"
  validates :user_id, presence: true
end
