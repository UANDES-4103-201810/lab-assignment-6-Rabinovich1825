class SessionsController < ApplicationController
	def new
	end

	def session_params
		params.require(:session).permit(:email, :password)
	end

	def create
		user = User.find_by_email(session_params[:email])
		if user != nil
			if session_params[:password] == user.password
				session[:current_user_id] = user.id
				session[:logged_in] = true
				flash[:notice] = "Logged in!"
				redirect_to :controller => 'users', :action => 'show', :id => user.id
			end
			flash[:notice] = "Log in failed!"
			session[:logged_in] = false
			redirect_to log_in_path
		else
			flash[:notice] = "Log in failed!"
      session[:logged_in] = false
      redirect_to log_in_path
		end
	end

	def destroy
    session[:logged_in] = false
    redirect_to root_path
	end
end
