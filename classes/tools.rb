class Tools
	attr_accessor :id, :function, :weight, :tool_x
	def initialize id,function,weight
		@id = id
		@function = function
		@weight = weight
	end

	def self.create_tool
		print 'Tool ID: '
		id = gets.chomp
		print 'The function of the tool: '
		function = gets.chomp
		print 'Is tool light, or heavy: '
		weight = gets.chomp
		@tool_x = Tools.new(id,function,weight)
	end

	def to_s
		"#{@id} for #{@function}"
	end
		
end
