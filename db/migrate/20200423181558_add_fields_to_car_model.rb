class AddFieldsToCarModel < ActiveRecord::Migration[6.0]
  def change
    add_column :car_models, :motorization, :string
    add_reference :car_models, :car_category, foreign_key: true
    add_column :car_models, :fuel_type, :string
  end
end
