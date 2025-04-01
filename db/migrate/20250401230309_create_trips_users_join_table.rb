class CreateTripsUsersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :trips_users, id: false do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :trip, foreign_key: true
    end
  end
end
