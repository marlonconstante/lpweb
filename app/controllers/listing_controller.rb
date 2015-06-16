class ListingController < ApplicationController
	
	def index
		@listing = Equipment.joins(:employee).select("employees.*, equipment.*")
	end
	
end
