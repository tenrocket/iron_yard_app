module AssignmentsHelper

	def create_assignment
		visit '/assignments/new'
		fill_in 'assignment[title]', with: "Create Portfolio"
		fill_in 'assignment[description]', with: 'You will love this assignment.'
		click_button 'SUBMIT'
	end

end