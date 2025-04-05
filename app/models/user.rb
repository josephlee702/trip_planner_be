class User < ApplicationRecord
  has_many :trips_users
  has_many :trips, through: :trips_users

  extend Devise::Models
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User
end
