class AddAddressToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :active, :boolean
  end
end
