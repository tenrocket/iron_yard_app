class User < ActiveRecord::Base
	has_many :assignments
	has_many :submissions
	has_many :comments, as: :commentable
	belongs_to :cohort

	has_secure_password
	validates_presence_of :email
	validates_uniqueness_of :email

	# after_create :new_user_message

end