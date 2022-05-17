class FixDatesInBookings < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :start_date, :date
    remove_column :users, :end_date, :date
    add_column :bookings, :start_date, :date
    add_column :bookings, :end_date, :date
  end
end
