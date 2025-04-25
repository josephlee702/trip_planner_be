class UpdateItineraryDates < ActiveRecord::Migration[7.0]
  def change
    remove_column :itineraries, :end_date, :date
    rename_column :itineraries, :start_date, :date
  end
end