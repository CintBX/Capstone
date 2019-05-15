require 'rails_helper'

describe 'Navigation'  do
	before do
		@portfolio = Portfolio.create(title: "Hello World", body: "I am here.")
		@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")

		visit new_user_session_path
		fill_in 'user[email]', with: "test@test.com"
		fill_in 'user[password]', with: "asdfasdf"
		click_on "Log in"
	end

	describe 'Index' do
		before do
			visit portfolios_path
		end

		it 'can be reached successfully' do
			expect(page.status_code).to eq(200)
		end

		it 'has a title of Portfolios' do
			expect(page).to have_content(/Portfolios/)
		end

		it 'has a list of Portfolios' do
			portfolio1 = Portfolio.create(title: "One", body: "Here we")
			portfolio2 = Portfolio.create(title: "Two", body: "Goooo")
			visit portfolios_path
			expect(page).to have_content(/One|Two/)
		end
	end

	describe 'Creation' do
		before do
			visit new_portfolio_path
		end

		it 'has a New page that can be accessed' do
			expect(page.status_code).to eq(200)
		end

		it 'can create a new Portfolio item with the New Form' do
			fill_in 'portfolio[title]', with: "Title"
			fill_in 'portfolio[body]', with: "Content"
			click_on "Save"

			expect(page).to have_content(/Title|Content/)
		end
	end

	describe 'Edit' do
		it 'can be reached by clicking Edit on the index page' do
			visit portfolios_path
			click_link "Edit"
			expect(page.status_code).to eq(200)
		end

		it 'can be edited' do
			visit edit_portfolio_path(@portfolio)
			fill_in 'portfolio[title]', with: "New Title"
			fill_in 'portfolio[body]', with: "New Content"
			click_on "Save"
			expect(page).to have_content(/New Title|New Content/)
		end
	end

	describe 'Delete' do
		it 'can be deleted' do
			visit portfolios_path
			click_link "Delete"

			expect(page.status_code).to eq(200)
		end
	end
end