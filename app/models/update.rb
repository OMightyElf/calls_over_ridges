class Update < ActiveRecord::Base
	belongs_to :child
	has_many :photos, class_name: 'PhotoAttachment'
	accepts_nested_attributes_for :photos
	validates :update_year, :update_month, :child_id, presence: true
	validate :unique_time

  mount_uploader :money_granting_proof, PictureUploader
  mount_uploader :support_proof, PictureUploader
	mount_uploader :video, VideoUploader

	def unique_time
	  if Child.find(child_id).updates.where(update_year: update_year, update_month: update_month).exists?
	  	errors.add(:update_month, "#{update_year} 年的 #{update_month} 月份已經有更新囉")
	  end
	end
end
