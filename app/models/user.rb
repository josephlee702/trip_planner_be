class User < ApplicationRecord
  include DeviseTokenAuth::Concerns::User

  has_many :trips_users
  has_many :trips, through: :trips_users
end
