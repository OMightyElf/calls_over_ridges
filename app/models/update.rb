class Update < ActiveRecord::Base
	belongs_to :child
	has_many :photo_attachments
	accepts_nested_attributes_for :photo_attachments

	validates :child_id, presence: true
end
