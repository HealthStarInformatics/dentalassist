class UserSessionsController < ApplicationController

	def new
		puts "came here"
		@user_session = UserSession.new
	end


	def create
		@user_session = UserSession.new(params[:user_session])
		if @user_session.save
			flash[:notice] = "Successfully Logged in"
			redirect_to medicalhistories_path
		else
			render :action => 'new'	
		end
	end

	def destroy
		@user_session = UserSession.find
		@user_session.destroy
		flash[:notice] = "Successfully logged out"
		redirect_to root_url
	end
	

end
