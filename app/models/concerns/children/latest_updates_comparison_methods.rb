module Children
	module LatestUpdatesComparisonMethods
		def comparison(attribute)
			updates = self.updates.order(update_year: :desc, update_month: :desc)
			lastest = self.updates.first.send(attribute)
			last_time = self.updates.count > 1 ? self.updates.first(2).last.send(attribute) : 0

			if lastest && last_time
				if lastest > last_time
					'greater_than'
				elsif lastest < last_time
					'less_than'
				else
					'equals_to'
				end
			else
				'equals_to'
			end
		end

		def comparison_word(attribute)
			Setting["#{attribute}.#{comparison(attribute)}"]
		end
	end
end
