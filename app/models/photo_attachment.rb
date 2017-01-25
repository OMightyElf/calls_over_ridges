class PhotoAttachment < ActiveRecord::Base
   # has_many :post_attachments
   # accepts_nested_attributes_for :post_attachments
    belongs_to :monthly_update, foreign_key: 'update_id', class_name: 'Update'
	  mount_uploader :picture, PictureUploader
end
