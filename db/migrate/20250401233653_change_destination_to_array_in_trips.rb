class ChangeDestinationToArrayInTrips < ActiveRecord::Migration[7.1]
  def change
    remove_column :trips, :destination, :string
    add_column :trips, :destinations, :string, array: true, default: []
  end
end
