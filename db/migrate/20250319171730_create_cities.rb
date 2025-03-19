class CreateCities < ActiveRecord::Migration[7.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :temperature
      t.integer :humidity
      t.string :weather_condition
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
