class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
