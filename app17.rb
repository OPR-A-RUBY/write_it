# ПРОГРАММА "Имя - Возраст"
#
arr = []

loop do

	arr0 = []
	
	print "Введите имя: "
	name = gets.strip
	
	break if name == ""
	
	print "Введите возраст: "
	age = gets.strip
	
	arr0 << name
	arr0 << age
	
	arr << arr0
	
end

x=0

arr.each do |item|
	x = x + 1
	puts "#{x} #{item[0]} #{item[1]}"
end
# конец программы "Имя - Возраст"
