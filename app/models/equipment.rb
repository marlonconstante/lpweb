class Equipment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :equipment_type
  
  validates :serial_number, :name, :description, :equipment_type, :presence => true
end
