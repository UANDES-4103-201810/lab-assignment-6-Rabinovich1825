class RegistrationsController < ApplicationController
	def new

	end

	def registrations_params
		params.require(:registrations).permit(:name, :last_name, :email, :password, :phone)
	end

	def create
		user = User.create(registrations_params)
		if user.valid?
			flash[:notice] = "Success: Singed in!"
			redirect_to root_path
		else
			puts user.errors.messages
			flash[:notice] = "Error: Sing in failed"
			redirect_to registrations_path
		end
	end

end
