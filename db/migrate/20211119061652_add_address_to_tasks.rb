class AddAddressToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :address, :string
  end
end
