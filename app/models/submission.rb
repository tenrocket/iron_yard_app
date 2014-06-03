class Submission < ActiveRecord::Base
	has_many :comments, as: :commentable
	belongs_to :user
	belongs_to :assignment

	accepts_nested_attributes_for :comments
	mount_uploader :attachment, HomeworkUploader

	validates_uniqueness_of :assignment_id, scope: :user_id

	def set_user!(user)
		self.user_id = user.id

		self.save
	end

end
