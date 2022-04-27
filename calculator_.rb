

puts 'Calculator by ready.'

actions = ['+','-','*','/']

while 2 * 2 == 4 do

	print 'Enter A: '
	a = gets.chomp
	
	exit if a == 'q'
	
	if a == ''
	  a = @rezult 
	else  
	  a = a.to_f
	end
	
	print 'Action ( + - * / ): '
	act = gets.strip
	  
	print 'Enter B: '
	b = gets.to_f
		
	puts "It will be Error? Ther Device by zero!" if act == '/' && b == 0
	
	if actions.include? act 
	  @rezult = eval "#{a} #{act} #{b}"
	  puts "#{a} #{act} #{b} = #{@rezult} "
	else
	  puts "This method #{act} is undefined here"
	
	end
	
	puts
	puts 'Enter "q" to quit now'
	puts 'Press Enter to use ansver'
end

puts 'Program is stoped.'
