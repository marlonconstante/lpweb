class CreateEquipment < ActiveRecord::Migration
  def change
    create_table :equipment do |t|
      t.string :code
      t.EquipmentType :type
      t.Employee :employee
      t.string :description

      t.timestamps null: false
    end
  end
end
