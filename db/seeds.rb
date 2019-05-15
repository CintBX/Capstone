@user = User.create(first_name: "Jon", last_name: "Snow", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")

puts "User created."

5.times do |blog|
	Blog.create!(
		title: "Blog #{blog}",
		body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
	)
end

puts "5 Blogs created."

10.times do |portfolio|
	Portfolio.create!(
		title: "Portfolio #{portfolio}",
		subtitle: "Testing",
		body: "asdfasdf",
		main_image: "https://via.placeholder.com/350",
		thumb_image: "https://via.placeholder.com/150"
	)
end

puts "10 Portfolios created."