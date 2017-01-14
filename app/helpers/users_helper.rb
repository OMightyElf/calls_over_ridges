module UsersHelper
	def progress_state_finished(current_state)
		User.current_states[@user.current_state] >= User.current_states[current_state] ? 'active' : ''
	end
end
