class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.date :checkin_date
    	t.date :checkout_date
    	t.references :user
    	t.references :listing
    	t.integer :people_count
    	t.integer :total_price
    	t.integer :day_count

      t.timestamps null: false
    end
  end
end
