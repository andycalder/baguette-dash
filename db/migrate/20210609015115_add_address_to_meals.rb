class AddAddressToMeals < ActiveRecord::Migration[6.0]
  def change
    add_column :meals, :address, :string
  end
end
