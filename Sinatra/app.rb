#encoding: utf-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'sqlite3'

def get_db
  return SQLite3::Database.new 'barbershop.db'
end

configure do
#  db = SQLite3::Database.new 'barbershop.db'
  db = get_db
  db.execute "CREATE TABLE IF NOT EXISTS 
    `Users` 
    (
    `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
    `username`	TEXT,
    `datastamp`	TEXT,
    `phone`	TEXT,
    `barber`	TEXT,
    `color`	TEXT 
    ) "
end

get '/' do
  erb :index
end

get '/about' do
  erb :about
end 

get '/visit' do
  erb :visit
end 

post '/visit' do
  @user_name = params[:user_name].capitalize
  @phone     = params[:phone]
  @date_time = params[:date_time]
  @barber    = params[:barber]
  @color     = params[:color]

  hh = {:user_name => 'Введите Ваше имя',
	    :phone => 'Введите телефон',
	:date_time => 'Введите дату и время',
	   :barber => 'Выберите парикмахера' }
  
  hh.each do |key, value|
    # если параметр (пришёл из браузера) пустой, то ...
    if params[key] == ''
      # ..., то переменной @error присвоить value из хэша hh
      # (а value из хэша - это сообщение об ошибке в переменной под именем key)
      # т.е. переменная @error теперь станет иметь - текст сообщения об ошибке
      @error = hh[key]
      
      # вернуть представление vivsit (с сообщением об ошибке)
      return erb :visit
    end
  end
  
  puts @date_time.class
  puts "#{@user_name} : #{@phone} : #{@date_time} : #{@barber} : #{@color}"  
  
  db = get_db
  db.execute "INSERT INTO Users 
    (
      'username', 
      'datastamp', 
      'phone', 
      'barber', 
      'color'
    ) 
    VALUES
    (?, ?, ?, ?, ?)",  [@user_name, @data_time, @phone, @barber, @color]
    
  @title = 'Отлично!'
  @message = "Спасибо вам, #{@user_name}. Будем ждать Вас к #{@date_time}."

  erb :message 
end	

get '/contacts' do
  erb :contacts
end 

get '/memory' do
  @arr = []
  in_f = File.open './public/users.txt', 'r'
  while (line = in_f.gets) 	 
    @arr << line.chomp	 
  end 				 
  in_f.close			 
  
  erb :memory
end 	
