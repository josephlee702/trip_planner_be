class CreateTripsUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :trips_users do |t|
      t.references :trip, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
