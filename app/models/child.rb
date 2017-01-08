class Child < ActiveRecord::Base
	validates :name, presence: true
	validates :serial_number, presence: true, uniqueness: true



	belongs_to :user, foreign_key: :supporter_id
	has_many :updates
	accepts_nested_attributes_for :updates

	enum gender: [:male, :female, :other]
end
