module DefaultPageContent
	extend ActiveSupport::Concern

	included do
		before_action :set_page_defaults
	end

	def set_page_defaults
		@page_title = "Cintron Capstone"
		@seo_keywords = "Dustin Cintron Devcamp Capstone"
	end
end