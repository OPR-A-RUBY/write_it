# coding: utf-8
# 
# ----------------------------------------------------------------------

class Country
  attr_reader :country_name, :airports_country
    
  def initialize name_in        # При создании страны создать:
    @country_name = name_in     #     название страны (строка)
    @b = []                     #     ???
    @airports_country = []      #     аэропорты страны (массив)
  end

  def add_port airport_in       # Добавить аэропорт в государство
    @airports_country << airport_in
  end
end
# ----------------------------------------------------------------------
class Airport
  attr_reader :name       # Имя аэропорта - только чтоние
  attr_accessor :mode     # Состояние - чтение и запись
  attr_reader :sity
  attr_reader :airplans   # Массив самолётов
    
  def initialize name_in, sity_in    
    @name = name_in              # Строка - название аэропорта
    @sity = sity_in              # Строка - город
    @airplans = []               # Массив - самолёты
  end
    
  def add_airplane plane_model
    @model = plane_model         # Строка - модель самолёта
    plane = Airplan.new(@model)  # создать объект новый САМОЛЁТ
    @airplans << plane           # ЗАПИСАТЬ в массив новый САМОЛЁТ
  end
end
# ----------------------------------------------------------------------
class Airplan
  attr_reader :model      # Модель самолёта - только чтение
    
  def initialize model_in
    @model = model_in    
  end
end
# ----------------------------------------------------------------------

# ====================================================== B E G I N =====
countrys = Array.new		# массив стран
# создаём три страны
me_country_1 = Country.new 'USA'		
me_country_2 = Country.new 'Russia'
me_country_3 = Country.new 'Japan'

countrys << me_country_1
countrys << me_country_2
countrys << me_country_3

airport_1 = Airport.new('Karamzin', 'Ulyanovsk')
airport_1.add_airplane('Boueng-777')
airport_1.add_airplane('Auerbus-230')
airport_1.add_airplane('Il-67')

airport_2 = Airport.new('Шереветьево', 'Москва')
airport_2.add_airplane('Boueng-777')
airport_2.add_airplane('Auerbus-230')
airport_2.add_airplane('Il-67')

me_country_2.add_port airport_1  # добавляем аэропорт №1 в страну
me_country_2.add_port airport_2  # 


# Выводим все данные по данной стране
countrys.each_with_index do |country_c, c|
  puts "#{c+1}. #{country_c.country_name} "+"="*36
  country_c.airports_country.each_with_index do |airport_i, i|
    puts
    puts " Аэропорт-#{i+1} '#{airport_i.name}' в #{airport_i.sity}"

    airport_i.airplans.each_with_index do |plane_j, j|
        
      puts "\t\t #{j+1} Самолёт - #{plane_j.model}."

    end
  end          
end
# ========================================================== E N D =====
