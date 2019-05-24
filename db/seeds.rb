@admin_user = User.create(name: "Dustin Cintron", username: "DCin", email: "d.cint88@gmail.com", password: "password", password_confirmation: "password")
puts "1 Admin created."


@user = User.create(name: "Jon Doe", username: "JD", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
puts "1 User created."


8.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio title: #{portfolio_item}",
		subtitle: "Ruby on Rails",
		body: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.",
		main_image: "https://via.placeholder.com/600x400",
		thumb_image: "https://via.placeholder.com/350x200"
	)
end
1.times do |portfolio_item|
	Portfolio.create!(
		title: "Portfolio title: #{portfolio_item}",
		subtitle: "Angular",
		body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat",
		main_image: "https://via.placeholder.com/600x400",
		thumb_image: "https://via.placeholder.com/350x200"
	)
end

puts "9 Portfolio Items created."


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