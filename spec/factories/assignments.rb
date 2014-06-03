FactoryGirl.define do
	
	factory(:assignment) do 
		title 'Create Portfolio'
		description 'You will love this assignment'
		due_date '2014-06-06'
		user_id '1'
		cohort_id '2'
	end

end