class ChangeDataStartDateToReservations < ActiveRecord::Migration[6.1]
  def change
    change_column :reservations, :start_date, :date
  end
end
