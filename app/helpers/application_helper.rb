module ApplicationHelper
	def login_helper style
		if current_user
			(link_to 'Logout', destroy_user_session_path, method: :delete, class: style)
		else
			(link_to 'Login', new_user_session_path, class: style) + 
			" ".html_safe + 
			unless current_page? portfolios_path
				(link_to 'Register', new_user_registration_path, class: style)
			end
		end
	end

	def source_helper(layout_name)
		if session[:source]
			greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
			content_tag(:p, greeting, class: 'source-greeting')
		end
	end

	def copyright_generator
		CintronViewTool::Renderer.copyright 'Dustin Cintron', 'All rights reserved'
	end

	def nav_items
		[
			{
				url: root_path,
				title: "Home"
			},
			{
				url: about_me_path,
				title: "About"
			},
			{
				url: portfolios_path,
				title: "Portfolio"
			},
			{
				url: discussions_path,
				title: "Discussion Board"
			}
		]
	end

	def nav_helper(style, tag_type)
		nav_links = ''
		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
		end

		nav_links.html_safe
	end

	def active? path
		"active" if current_page? path
	end
end