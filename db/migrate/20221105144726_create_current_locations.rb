class CreateCurrentLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :current_locations do |t|
      t.float :latitude
      t.float :longitude
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
