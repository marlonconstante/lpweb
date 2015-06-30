class UsersController < ApplicationController
	
	before_filter :authenticate_user!
	
	def index
	  @user_list = User.all	
	end

end