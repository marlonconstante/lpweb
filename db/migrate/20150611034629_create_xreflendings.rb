class CreateXreflendings < ActiveRecord::Migration
  def change
    create_table :xreflendings do |t|
      t.references :equipment, index: true, foreign_key: true
      t.references :employee, index: true, foreign_key: true
      t.timestamp :lend_date
      t.timestamp :return_date

      t.timestamps null: false
    end
  end
end
