
class Warrior
	attr_accessor :name, :skill, :warrior_x, :tools
	def initialize name,skill
		@skill = skill
		@name = name
		@tools = ['dagger','armor']		
	end

	def self.register
		print 'Warrior name: '
		name = gets.chomp
		# army.base.platoons try to show platoon options
		print 'Warrior skill or position: '
		skill = gets.chomp
		@warrior_x = Warrior.new(name,skill)
		#select base then add warrior to platoon
	end







	def to_s
		"#{name} the #{@skill}"
		
	end

	def add_tools tool
		@tools.push tool
	end

end