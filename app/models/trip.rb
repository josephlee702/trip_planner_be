class Trip < ApplicationRecord
  has_many :trips_users
  has_many :trips, through: :trips_users
end
