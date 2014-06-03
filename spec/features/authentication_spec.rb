require 'rails_helper'
include AuthenticationHelper

feature "authentication" do
	let(:user) { FactoryGirl.create(:user) }

	scenario "login in with correct password" do
		login(user)
		current_path.should eq("/users/#{user.id}")
	end

end