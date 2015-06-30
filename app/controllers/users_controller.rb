class UsersController < ApplicationController
	
	before_filter :authenticate_user!
	
	def index
	  @user_list = User.all	
	end
	
	def destroy
		@user = User.find(params[:id])
		@user.destroy
		
		if @user.destroy
		    redirect_to users_path, notice: "Usuário deletado com sucesso."
		end
	end

end