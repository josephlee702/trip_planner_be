class Itinerary < ApplicationRecord
  belongs_to :trip

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :description, presence: true
end
