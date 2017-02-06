class Update < ActiveRecord::Base
	belongs_to :child
	has_many :photos, class_name: 'PhotoAttachment'
	accepts_nested_attributes_for :photos

  mount_uploader :money_granting_proof, PictureUploader
  mount_uploader :support_proof, PictureUploader
	mount_uploader :video, VideoUploader
end
