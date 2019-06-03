# After bundle exec rake db:setup, enter the Console and do `User.first.add_role "admin"`

# Users
@admin_user = User.create(name: "Dustin Cintron", username: "DCin", email: "d.cint88@gmail.com", password: "password", password_confirmation: "password")
puts "1 Admin created."

@user = User.create(name: "Jon Doe", username: "JD", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
puts "1 User created."


# Portfolio
devcamp_portfolio = Portfolio.create!(
	title: "Devcamp Portfolio",
	subtitle: "Ruby on Rails",
	body: "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish.",
	main_image: "https://via.placeholder.com/600x600",
	thumb_image: "https://via.placeholder.com/500x425"
)

overtime_app = Portfolio.create!(
	title: "Overtime App",
	subtitle: "Ruby on Rails",
	body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus.",
	main_image: "https://via.placeholder.com/600x600",
	thumb_image: "https://via.placeholder.com/500x425"
)

angular_app = Portfolio.create!(
	title: "Freelancer Dashboard",
	subtitle: "Typescript and Angular",
	body: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo.",
	main_image: "https://via.placeholder.com/600x600",
	thumb_image: "https://via.placeholder.com/500x425"
)
puts "3 Portfolio Items created."

3.times do |technology|
	Portfolio.first.technologies.create!(name: "Technology #{technology}")
end
3.times do |technology|
	Portfolio.second.technologies.create!(name: "Technology #{technology}")
end
3.times do |technology|
	Portfolio.last.technologies.create!(name: "Technology #{technology}")
end
puts "9 Technologies created."


# Discussion Board
@channel_one = Channel.create!(channel: "General Topics")
@channel_two = Channel.create!(channel: "Software Development")
@channel_three = Channel.create!(channel: "Jobs and Careers")
@channel_four = Channel.create!(channel: "Entertainment")
puts "4 Channels created."

3.times do |discussion|
	Discussion.create!(title: "General discussion #{discussion}",
										content: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio.",
										user_id: @admin_user.id,
										channel_id: @channel_one.id
	)
end
3.times do |discussion|
	Discussion.create!(title: "Software development discussion #{discussion}",
										content: "Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus.",
										user_id: @user.id,
										channel_id: @channel_two.id
	)
end
3.times do |discussion|
	Discussion.create!(title: "Finding the right career discussion #{discussion}",
										content: "Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.",
										user_id: @admin_user.id,
										channel_id: @channel_three.id
	)
end
3.times do |discussion|
	Discussion.create!(title: "Entertaining trends and such #{discussion}",
										content: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
										user_id: @user.id,
										channel_id: @channel_four.id
	)
end
puts "12 Discussions created."