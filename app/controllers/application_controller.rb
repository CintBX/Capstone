class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
	protect_from_forgery with: :exception
	include DeviseWhitelist
	include DefaultPageContent

	before_action :set_source

	def set_source
		session[:source] = params[:q] if params[:q]
	end
end
