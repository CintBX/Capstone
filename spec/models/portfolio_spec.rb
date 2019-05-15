require 'rails_helper'

RSpec.describe Portfolio, type: :model do
	before do
		@portfolio = Portfolio.create(title: "My First Portfolio", subtitle: "Testing", body: "asdfasdf", main_image: "https://via.placeholder.com/350", thumb_image: "https://via.placeholder.com/150")
	end

	it 'can be created' do
		expect(@portfolio).to be_valid
	end

	it 'cannot be created without a title and body' do
		@portfolio.title = nil
		@portfolio.body = nil
		expect(@portfolio).to_not be_valid
	end
end