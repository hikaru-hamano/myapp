class AddPriceToReservations < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :price, :bigint
    add_column :reservations, :total, :bigint
  end
end
