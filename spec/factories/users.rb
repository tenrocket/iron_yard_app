FactoryGirl.define do
	
	factory(:user) do
		email "rob@bobcatmoo.com"
		password "123"
		password_confirmation "123"
	end

	factory(:invalid_user) do
		email nil
		password "123"
		password_confirmation "123"
	end

end