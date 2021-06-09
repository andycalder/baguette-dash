class AddCoordinatesToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :latitude, :float
    add_column :meals, :longitude, :float
  end
end
