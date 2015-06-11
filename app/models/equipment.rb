class Equipment < ActiveRecord::Base
  belongs_to :employee
  belongs_to :equipment_type
end
