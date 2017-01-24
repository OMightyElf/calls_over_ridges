class Attachment < ActiveRecord::Base
   # has_many :post_attachments
   # accepts_nested_attributes_for :post_attachments
    belongs_to :update
	  mount_uploader :picture, PictureUploader
end
