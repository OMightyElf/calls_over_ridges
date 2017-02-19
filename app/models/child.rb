class Child < ActiveRecord::Base
	validates :name, presence: true
	validates :serial_number, presence: true, uniqueness: true
	validates_format_of :serial_number, with: /\A[0-9a-zA-Z]*\z/
	include Children::LatestUpdatesComparisonMethods

	belongs_to :user, foreign_key: :supporter_id
	has_many :updates, dependent: :destroy
	accepts_nested_attributes_for :updates

	enum gender: [:male, :female, :other]

	def statics_last_six_months_of(attribute)
		updates.pluck(attribute)
	end

	def update_month_last_six_months
		updates.map { |u| I18n.t('date.month_names')[u.update_month || 0] }
	end

	def latest_update
		updates.order(update_year: :desc, update_month: :desc).first
	end
end
