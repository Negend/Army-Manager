class Platoon
	attr_accessor :type
	def initialize type
		@type = type
		@warriors = []
		

	end

	def add_warrior war
		@warriors.push war		
	end




	def to_s
		"#{@warriors.length} warrior(s) of #{@type}s "
	end
end