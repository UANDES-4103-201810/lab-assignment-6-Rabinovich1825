class SessionsController < ApplicationController
	def new
	end

	def session_params
		params.require(:session).permit(:email, :password)
	end

	def create
		user = User.find_by_email(session_params[:email])
		if user != nil
			session[:current_user_id] = user.id
			redirect_to :controller => 'users', :action => 'show', :id => user.id
		else
			flash[:notice] = ""
		end
	end

	def destroy
		#complete this method
	end
end
