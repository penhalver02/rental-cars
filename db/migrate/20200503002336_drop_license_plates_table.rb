class DropLicensePlatesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :license_plates
  end
end
