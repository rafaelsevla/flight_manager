class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :user_groups, dependent: :destroy
  has_many :groups, through: :user_groups
  has_many :permissions, through: :groups

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
