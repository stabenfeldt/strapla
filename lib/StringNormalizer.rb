class DateConverter

	def self.us_to_european(date)
		Date.strptime(date, "%m/%d/%Y")
	end

end
