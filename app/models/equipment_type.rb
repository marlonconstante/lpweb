class EquipmentType < ActiveRecord::Base
	has_many :equipment
	
	validates :name, :presence => true
end
