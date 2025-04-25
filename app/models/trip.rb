class Trip < ApplicationRecord
  has_many :trips_users, dependent: :destroy
  has_many :users, through: :trips_users
  has_many :itineraries, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  def end_date_after_start_date
    if end_date.present? && start_date.present? && end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
