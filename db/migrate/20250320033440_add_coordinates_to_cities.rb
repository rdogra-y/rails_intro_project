class AddCoordinatesToCities < ActiveRecord::Migration[7.2]
  def change
    add_column :cities, :latitude, :float
    add_column :cities, :longitude, :float
  end
end
