class Update < ActiveRecord::Base
	belongs_to :child
	has_many :photos, class_name: 'PhotoAttachment'
	accepts_nested_attributes_for :photos
end
