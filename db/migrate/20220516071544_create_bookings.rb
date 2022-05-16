class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :animal_id, null: false, foreign_key: true
      t.references :user_id, null: false, foreign_key: true
      t.enum_status :status

      t.timestamps
    end
  end
end
