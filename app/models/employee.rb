class Employee < ActiveRecord::Base
  belongs_to :sector
  belongs_to :location
end
