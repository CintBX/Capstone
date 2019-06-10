# After bundle exec rake db:setup, enter the Console and do `User.first.add_role "admin"`

# Users
@admin_user = User.create(name: "Dustin Cintron", username: "DCin", email: "d.cint88@gmail.com", password: "somepassword", password_confirmation: "somepassword")
puts "1 Admin created."

@user = User.create(name: "Jon Doe", username: "JD", email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf")
puts "1 User created."


# Portfolio
devcamp_portfolio = Portfolio.create!(
	title: "Devcamp Portfolio",
	subtitle: "Ruby on Rails",
	body: "Devcamp-Portfolio is the first and primary project I built during my time as a Devcamp student.  This application features multiple pages and layouts, each with their own respective style and functionality.

**The main layout of the entire app**  contains 4 pages:
- a Home page with a video background
- an About page with drop-down buttons for my resume
- a Contact page with my info and google maps rendering
- a 'Tech News' page that renders random, new tweets made by users who are discussing Rails

**The Blog**  features:
- it's own layout provided by bootstrap
- a sidebar that includes links to my social media
- a list of blogs that can be Drafts or Published
- full pagination that occurs without page reload
- comments under each blog, rendered without page reload

**The Portfolios page** is where users can upload their portfolio items neatly organized for potential employers.  Includes:
- it's own layout provided by bootstrap
- a drop-down navigation header
- drag-n-drop functionality 
- image file upload system",
	main_image: "devcamp_2.png",
	thumb_image: "devcamp_1.png"
)

overtime_app = Portfolio.create!(
	title: "Overtime App",
	subtitle: "Ruby on Rails",
	body: "Overtime App, also called Time Tracker, is the second project I created.  With Overtime,  managers can give their employees the ability to request overtime.  They can also track those overtime requests and verify if the overtime was worked or not.

This application is different depending on what kind of user is accessing it (Users vs Admin users).

**Users represent the employees.**
They can:
- create an account
- log on and request extra time 
- specifying how many extra hours they would like to work

**Admin users represent the supervisors and managers.**
Admins have access to:
- a list of all pending OT requests
- a directory containing the info of every employee in the company 
- the *Admin Dashboard*, which organizes overtime requests and lists all employees and managers.  **Users do not have access to this page.**",
	main_image: "overtime_2.jpg",
	thumb_image: "overtime_1.jpg"
)

angular_app = Portfolio.create!(
	title: "Freelancer Dashboard",
	subtitle: "Typescript and Angular",
	body: "The Freelance Camp Dashboard is the third demo application I made for Devcamp.  

This app is designed for freelancers.  It is a dashboard one can use to organize their work for past clients, as well as create proposals for future clients.

**This project is created in Microservice architecture.** It contains three components:
- a front-end, client-side app written in TypeScript using Angular framework
- a back-end rails microservice that sends Documents data to the front-end
- another back-end rails microservice that contains and organizes Proposals a freelancer has made to various clients",
	main_image: "freelance_2.jpg",
	thumb_image: "freelance_1.jpg"
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