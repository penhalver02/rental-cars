class AddCarCategoryToCars < ActiveRecord::Migration[6.0]
  def change
    add_reference :cars, :car_category, foreign_key: true
  end
end
