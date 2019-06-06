module UserRoles
	extend ActiveSupport::Concern

	def has_role?(role)
		current_user && current_user.has_role?(role)
	end

	def discussion_author(discussion)
		user_signed_in? && current_user.id == discussion.user_id
	end

	def reply_author(reply)
		user_signed_in? && current_user.id == reply.user_id
	end
end