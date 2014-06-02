class Assignment < ActiveRecord::Base
	has_many :comments, as: :commentable
	has_many :submissions
	belongs_to :user
	belongs_to :cohort

	accepts_nested_attributes_for :comments
end
