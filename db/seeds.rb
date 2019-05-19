@user = User.create(name: "Dustin Cintron", username: "DCint", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")

puts "User created."

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