class Message < ActiveRecord::Base
	validates :content, :target, :user_id, presence: true

	enum target: [:to_team, :to_kid]

	belongs_to :user
end
