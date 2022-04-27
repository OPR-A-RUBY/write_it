# ПРОГРАММА "Имя - Возраст - 2+"
#

@hh = {}

def add_person options
# добавляет пару в хэш
	@hh[options[:name]] = options[:age]
end

def show_hash 
# выводит полностью весь хэш
	@hh.each do |key, value|
		puts "#{key} - #{value}"
	end
end

def is_already_person name
	puts "Already exsist! - #{name} = #{@hh[name]}" if @hh[name]
end

loop do
# 
	print 'Enter name: '
	name = gets.chomp.capitalize
	is_already_person name
		 
	break if name == ''
	
	print 'Enter age: '
	age = gets.to_i
	
	opt = {:name => name, :age => age}
	add_person opt
	# можно задать данные прямо в строке вызова add_person ({...})
	# add_person ({:name => name, :age => age})
	
	show_hash 
	
end 	

puts
show_hash 
# конец программы "Имя - Возраст - 2+"
