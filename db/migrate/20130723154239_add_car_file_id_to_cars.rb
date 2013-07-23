class AddCarFileIdToCars < ActiveRecord::Migration
  def change
    add_column :cars, :car_file_id, :integer
  end
end
