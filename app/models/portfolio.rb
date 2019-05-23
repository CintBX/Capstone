class Portfolio < ApplicationRecord
	validates_presence_of :title, :body
	has_many :technologies

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= "https://via.placeholder.com/350"
		self.thumb_image ||= "https://via.placeholder.com/150"
	end
end
