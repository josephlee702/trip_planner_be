class Itinerary < ApplicationRecord
  belongs_to :trip

  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
