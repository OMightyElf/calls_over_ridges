class Child < ActiveRecord::Base
	belongs_to :user, foreign_key: :supporter_id
end
