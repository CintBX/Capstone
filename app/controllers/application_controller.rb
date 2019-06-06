class ApplicationController < ActionController::Base
	# before_action :authenticate_user!
	protect_from_forgery with: :exception
	include DeviseWhitelist
	include DefaultPageContent
	include SetSource
	include UserRoles
end
