class Employee < ActiveRecord::Base
  belongs_to :sector
  belongs_to :location
  
  validates :name, :sector, :location, :presence => true
end
