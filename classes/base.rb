class Base
	attr_accessor :location, :platoons, :tools_for_base
	def initialize location
		@location = location
		@platoons = []
		@tools_for_base = []

	end

	def add_platoon platoon
		@platoons.push platoon		
	end

	def add_tool tool
		@tools_for_base.push tool
	end

	def to_s
		"#{@location} base"
	end	
end