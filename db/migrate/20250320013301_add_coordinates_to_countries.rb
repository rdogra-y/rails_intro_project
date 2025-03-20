class AddCoordinatesToCountries < ActiveRecord::Migration[7.2]
  def change
    add_column :countries, :latitude, :float
    add_column :countries, :longitude, :float
  end
end
