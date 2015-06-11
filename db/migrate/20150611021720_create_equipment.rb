class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :serial_number
      t.string :name
      t.string :description
      t.references :employee, index: true, foreign_key: true
      t.references :equipment_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
