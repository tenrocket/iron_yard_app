class Submission < ActiveRecord::Base
	has_many :comments, as: :commentable
	belongs_to :user
	belongs_to :assignment

	accepts_nested_attributes_for :comments
	mount_uploader :attachment, HomeworkUploader

	def set_user!(user)
		self.user_id = user.id
		self.save!
	end

end
