class AddColumnsToBoat < ActiveRecord::Migration[5.2]
  def change
    add_column :boats, :price, :numeric
    add_column :boats, :model, :string
  end
end
