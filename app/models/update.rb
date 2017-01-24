class Update < ActiveRecord::Base
	belongs_to :child
   has_many :attachments
   accepts_nested_attributes_for :attachments
end
