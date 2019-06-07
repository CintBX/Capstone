class SessionsController < Devise::SessionsController
	layout 'application'

	private

	def sign_up_params
		params.require(:user).permit(:username, :name, :email, :password, :password_confirmation)
	end

	def account_update_params
		params.require(:user).permit(:username, :name, :email, :password, :password_confirmation, :current_password)
	end
end