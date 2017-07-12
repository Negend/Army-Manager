require_relative 'classes/army.rb'
require_relative 'classes/base.rb'
require_relative 'classes/platoon.rb'
require_relative 'classes/warrior.rb'
require_relative 'classes/tools.rb'

@army_1 = Army.new('Murkville','Negend')

def menu
	play = true
	while play
	       print "Type following commands (B) for Bases (P) to create platoon (W) to register (T) to add tools (Quit) to quit: "
	       user_input = gets.chomp

	       case user_input
	       when "B"
	       		puts "Current bases in #{@army_1}"
	       		for i in 0..(@army_1.base.length-1) do 
		       		puts "Base #{i}: #{@army_1.base[i]}"
		       	end
		       	print 'Make (N)ew base?: '
		       	if gets.chomp == 'N'
		       		make = true
			       	while make
			       		make = false
			       	   	print "location of base: "
			       	    @base_x = Base.new(gets.chomp)
			       	    puts @base_x
			       	    @army_1.add_base @base_x
			       	    puts "Current bases in #{@army_1}"
			       		for i in 0..(@army_1.base.length-1) do 
				       		puts "Base #{i}: #{@army_1.base[i]}"
				       	end	       	   
			       	    print 'Register more (Y): '
			           	case gets.chomp		           
			           		when 'Y'
			           			make = true
			           	end
				    end
				end
	           
	       when "P"
	       		make = true
		       	
	       		puts "Current bases in #{@army_1}"
	       		for i in 0..(@army_1.base.length-1) do 
		       		puts "Base #{i}: #{@army_1.base[i]}"
		       	end
		       	print "Select Base number to view platoons: "
		       	base_z = @army_1.base[gets.chomp.to_i]
		      	puts "Current Platoons in #{base_z}"
	       		for i in 0..(base_z.platoons.length-1) do 
		       		puts "Platoon #{i}: #{base_z.platoons[i]}"
		       	end
		       	print 'make (N)ew?: '
		       	if gets.chomp == 'N'
					while make
		       			make = false
				       	types = ['commander','archer','foot','cavalry','healer']			       	
				       	for i in 0..(types.length-1) do 
				       		puts "Type #{i}: #{types[i]}"
				       	end
				       	print 'Select platoon type: '
				       	@platoon_x = Platoon.new(types[gets.chomp.to_i])				       	
			            base_z.add_platoon @platoon_x
			            puts "Current Platoons in #{base_z}"
			       		for i in 0..(base_z.platoons.length-1) do 
				       		puts "Platoon #{i}: #{base_z.platoons[i]}"
				       	end

			            print 'Register more (Y): '
			           	case gets.chomp		           
			           	when 'Y'
			           		make = true
			           	end
		           	end
		        end
	    
	       when "W"
		       	make = true
		       	while make
		       		for i in 0..(@army_1.base.length-1) do 
		       			puts "Base #{i}: #{@army_1.base[i]}" 
		    		end
		       		print 'Which base number: '
		       		base_y = @army_1.base[gets.chomp.to_i]
		       		puts "Current Platoons in #{base_y}"
		       		for i in 0..(base_y.platoons.length-1) do 
			       		puts "Platoon #{i}: #{base_y.platoons[i]}"
			       	end
			       	print 'Choose platoon: '
			       	@platoon_y = base_y.platoons[gets.chomp.to_i]
		           	register
		           	
		           	
		           	puts base_y.platoons
		           	print 'View list of all warriors? Y/N: '
		           	if gets.chomp == 'Y'
		           		puts @army_1.men
		           	end
		           	print 'Register more Y/N: '
		           	case gets.chomp		           
		           		when 'N'
		           			make = false
		           	end	
		        end
	       # when "W"
	       #     	make_a_passenger
	       when "T"
	       	   	create_tool
			   	puts @tool_x 
			   	if @tool_x.function == 'transport'
			   		assign_tool 'cavalry'
			   		assign_tool 'commander'
			   	elsif @tool_x.function == 'medical'
			   		assign_tool 'healer'
			   	elsif @tool_x.function == 'archery'
			   		assign_tool 'archer'
			   	elsif @tool_x.function == 'short_range_attack'
			   		assign_tool 'commander'
			   		assign_tool 'foot'
			   	elsif @tool_x.function == 'mid_range_attack'
			   		assign_tool 'cavalry'
			   	elsif @tool_x.function == 'shield'
			   		assign_tool 'foot'
			   		assign_tool 'commander'
			   	else	
			   		for i  in 0..(@army_1.base.length-1) do 
	       			puts "Base #{i}: #{@army_1.base[i]}" 
		    		end
		       		print 'Which base number: '
		       		base_y = @army_1.base[gets.chomp]
				   	base_y.add_tool	tool_x			
			   		
			   			
			   	end	
			   		
	       when "Quit"
	           	puts "Goodbye!"
	           	play = false
	       else
	           	puts "That's not an option"
	       end
	   end
end
def assign_tool warrior_skill
	@army_1.men.each { |man| man.add_tools @tool_x if man.skill == warrior_skill}
	for i in 0..(@army_1.men.length-1) do 
	puts "Warrior #{i}: #{@army_1.men[i]}" 
	end
	print 'Which warrior number: '
	warrior_y = @army_1.men[gets.chomp.to_i]
   	puts warrior_y.tools
end


def create_tool
	print 'Tool name: '
	id = gets.chomp
	functions = ['transport','short_range_attack','shield','mid_range_attack','archery','medical','other']
	puts functions
	print 'The function of the tool (type one of the options): '
	function = gets.chomp
	print 'Is tool light, or heavy: '
	weight = gets.chomp
	@tool_x = Tools.new(id,function,weight)
	for i in 0..(@army_1.men.length-1) do 
		puts "Warrior #{i}: #{@army_1.men[i]}" 
	end
	print 'Which warrior number: '
	warrior_y = @army_1.men[gets.chomp.to_i]
   	puts warrior_y.tools	
end
# create_tool
# puts @tool_x


# warrior_1.add_tools @tool_x
# warrior_2.add_tools tool_1
# warrior_1.add_tools tool_1
# warrior_1.add_tools tool_2
# warrior_1.add_tools tool_3
# warrior_2.add_tools tool_4

def register
	print 'Warrior name: '
	name = gets.chomp
    skill = @platoon_y.type
	warrior_x = Warrior.new(name,skill)
	@platoon_y.add_warrior warrior_x
	@army_1.add_warrior warrior_x
	#select base then add warrior to platoon
end
menu
# register
# army_1.add_warrior @warrior_x
# puts army_1.base
# puts base_1.platoons
# puts army_1.men
# puts 'tools of warrior one'
# puts warrior_1.tools
# puts 'tools of warrior two'
# puts warrior_2.tools