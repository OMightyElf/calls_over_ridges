class Update < ActiveRecord::Base
	belongs_to :child
	has_many :photos, foreign_key: 'update_id', class_name: 'PhotoAttachment'
	accepts_nested_attributes_for :photo_attachments

	validates :child_id, presence: true
end
