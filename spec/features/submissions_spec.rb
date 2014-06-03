require "rails_helper"
include AuthenticationHelper
include AssignmentsHelper

feature "Submissions" do
	let(:user) { FactoryGirl.create(:user) }
	let(:assignment) { FactoryGirl.create(:assignment) }

	scenario "User creates two submissions for one assignment" do
		login(user)
		create_assignment

		visit "/submissions/new"

		fill_in 'submission[title]', with: 'This is just a test' 
		fill_in 'submission[description]', with: 'This too is a test'
		click_button 'SUBMIT'

		current_path.should eq(submissions_path)

		visit "/submissions/new"
		fill_in 'submission[title]', with: 'This is just a test' 
		fill_in 'submission[description]', with: 'This too is a test'
		click_button 'SUBMIT'

		current_path.should eq("/submissions/new")
		page.has_content?('Sorry, you can only submit once per assignment.')

	end

end