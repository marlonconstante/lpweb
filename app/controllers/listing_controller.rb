class ListingController < ApplicationController
	
	before_filter :authenticate_user!
	
	def index
		@listing_associated = Equipment.joins(:equipment_type).joins(:employee).select("employees.*, equipment.*")
		@listing_available = Equipment.joins(:equipment_type).select("equipment.*").where("employee_id is null")
	end
	
end
