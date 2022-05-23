class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :type
      t.string :description
      t.integer :price

      t.timestamps
    end
  end
end
