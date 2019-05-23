@admin_user = User.create(name: "Dustin Cintron", username: "DCin", email: "d.cint88@gmail.com", password: "password", password_confirmation: "password")
puts "1 Admin created."


@user = User.create(name: "Jon Doe", username: "JD", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
puts "1 User created."


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

3.times do |technology|
	Portfolio.last.technologies.create!(name: "Technology #{technology}")
end
puts "3 Technologies created."


@channel_one = Channel.create!(channel: "General Topics")
@channel_two = Channel.create!(channel: "Software Development")
@channel_three = Channel.create!(channel: "Entertainment")
puts "3 Channels created."


Discussion.create!(title: "Latin Text",
									content: "The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from 'de Finibus Bonorum et Malorum' by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.",
									user_id: @user.id,
									channel_id: @channel_one.id)
Discussion.create!(title: "Ruby on Rails",
									content: "I am working on my Capstone project to become a professional Ruby on Rails developer.",
									user_id: @admin_user.id,
									channel_id: @channel_two.id)
Discussion.create!(title: "Freelance Application",
									content: "This is an application called Freelance Camp.  It is designed to be used by freelancers who wish to organize their documents, showcase their abilities and send/manage proposals to clients.  The application itself is rather small and is only the Front-End, but it connects to 2 external Rails APIs in order to render it's data.  The main application is written in TypeScript using the Angular framework.",
									user_id: @admin_user.id,
									channel_id: @channel_two.id)
Discussion.create!(title: "Game of Thrones",
									content: "I am disappointed in the ending.",
									user_id: @user.id,
									channel_id: @channel_three.id)
Discussion.create!(title: "Super Smash Brothers",
									content: "I use Samus Mario Richter Snake and Zelda.  Who is your main?",
									user_id: @admin_user.id,
									channel_id: @channel_three.id)
puts "5 Discussions created."