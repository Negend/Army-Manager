class Army
	attr_accessor :base, :enemies, :king, :men 
	attr_reader :country 

	def initialize country,king
		@country = country
		@base = []
		@enemies = []
		@king = king
		@men = []		
	end

	def add_base name
		@base.push name
	end

	def add_enemy opponent
		@enemies.push opponent
	end

	def add_warrior warrior
		@men.push warrior
	end

	def to_s
		"King #{@king}s army of #{@country}"
	end
end