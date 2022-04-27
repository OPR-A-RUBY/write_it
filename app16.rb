	print 'Enter A: '
	a = gets.to_f
	
	print 'Enter B: '
	b = gets.to_f
	
	print 'Case action ( + - * / ): '
	op = gets.strip
		
	puts "It's Error? Divicy by zero!" if op == '/' && b ==0
	
	if op == '+' 
		rezult = a + b
	
	elsif op == '-'
		rezult = a - b
	
	elsif op == '*'		
		rezult = a * b
		
	elsif op == '/'
		rezult = a / b
	
	else
		puts 'Bad action'
		exit
	end

	puts "#{a} #{op} #{b} = #{rezult}"
