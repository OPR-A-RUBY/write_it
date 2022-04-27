# coding: utf-8
#
def me_line
	puts "="*40
	puts
end
 
class Airport
    attr_reader :name       # Имя аэропорта - только чтоние
    attr_accessor :mode     # Сомтояние - чтение и запись
    attr_reader :sity
    attr_reader :country
    attr_reader :airplans   # Массив самолётов
    
    def initialize name_in, sity_in, country_in 
        @name = name_in
        @sity = sity_in
        @country = country_in
        @airplans = []
    end
    
    def add_airplane plane_model  # Возьмёт 'Boueng-777' см. ниже
        @model = plane_model
        plane = Airplan.new(@model) # Передаёт параметр в initialize
									# класса Airplan 
        @airplans << plane
    end
end

class Airplan
    attr_reader :model      # Модель самолёта - только чтение
    
    def initialize model_in 	# сюда передаёт.
        @model = model_in
    end
end

air_ports = Array.new 	# Массив всех аэропортов

# первый аэропорт
air_port_1 = Airport.new('Karamzin', 'Ulyanovsk', 'Russia')
air_port_1.add_airplane('Boueng-777')
air_port_1.add_airplane('Auerbus-230')
air_port_1.add_airplane('Il-67')

models = ['Boueng-777', 'Auerbus-230', 'Il-67']
7.times do 	# Добавим ещё 7 самолётов
	model = models[rand(0..2)]
	air_port_1.add_airplane(model)
end

# Второй фэропорт
air_port_2 = Airport.new('Gelmut Kol', 'Berlin', 'Germany')
air_port_2.add_airplane('Boueng-777')
air_port_2.add_airplane('Auerbus-230')
air_port_2.add_airplane('Il-67')

# Первый и Второй аэропорты поместить в массив всех Аэропортов
air_ports << air_port_1
air_ports << air_port_2

# Вывести все аэропорты со своими самолётами
air_ports.each_with_index do |airport_i, i|

   puts "#{i+1} Аэропорт '#{airport_i.name}' в городе #{airport_i.sity}"
   puts "____________________________  в #{airport_i.country}"
    
   airport_i.airplans.each_with_index do |plane_j, j|
        puts "\t\t #{j+1} Самолёт - #{plane_j.model}."
    end  
   me_line
   
end
