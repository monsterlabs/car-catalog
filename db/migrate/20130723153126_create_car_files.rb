class CreateCarFiles < ActiveRecord::Migration
  def change
    create_table :car_files do |t|
      t.string :serie
      t.string :line
      t.string :model
      t.integer :year
      t.string :xls
      t.string :image
      t.text   :xls_errors
      t.boolean :imported, default: false

      t.timestamps
    end
  end
end
