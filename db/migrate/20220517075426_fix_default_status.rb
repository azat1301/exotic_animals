class FixDefaultStatus < ActiveRecord::Migration[6.1]
  def change
    remove_column :bookings, :status
    add_column :bookings, :status, :integer, default: 0
  end
end
