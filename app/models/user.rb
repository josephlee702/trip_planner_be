class User < ApplicationRecord
  extend Devise::Models
  include DeviseTokenAuth::Concerns::User

  has_many :trips_users
  has_many :trips, through: :trips_users

  validates :email, presence: true, uniqueness: true
  #on: :create makes sure the password validation only happens when creating a new user
  validates :password, presence: true, length: { minimum: 4 }, on: :create
end
