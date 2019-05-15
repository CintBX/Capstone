require 'rails_helper'

RSpec.describe User, type: :model do
	before do
		@user = User.create(first_name: "Jon", last_name: "Snow", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
	end

	it 'can be created' do
		expect(@user).to be_valid
	end

  it 'cannot be created without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'cannot be created without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
end