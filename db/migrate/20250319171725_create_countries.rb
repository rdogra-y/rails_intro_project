class CreateCountries < ActiveRecord::Migration[7.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :capital
      t.integer :population
      t.string :currency

      t.timestamps
    end
  end
end
