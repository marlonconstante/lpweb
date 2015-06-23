class Xreflending < ActiveRecord::Base
  belongs_to :equipment
  belongs_to :employee
  
  validates :equipment, :employee, :lend_date, :return_date, :presence => true
  
end
