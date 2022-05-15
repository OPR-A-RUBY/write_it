#encoding: utf-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'sqlite3'

configure do
  @db = SQLite3::Database.new 'barbershop.db'
  @db.execute "CREATE TABLE IF NOT EXISTS 
    `Users` 
    (
    `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
    `username`	TEXT NOT NULL,
    `datastamp`	TEXT NOT NULL,
    `phone`	TEXT NOT NULL,
    `barber`	TEXT NOT NULL,
    `color`	TEXT NOT NULL
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
  
  puts "#{@user_name} : #{@phone} : #{@date_time} : #{@barber} : #{@color}"
  
  @title = 'Отлично!'
  @message = "Спасибо вам, #{@user_name}. Будем ждать Вас к #{@date_time}."

  out_f = File.open './public/users.txt', 'a'
  out_f.write "User: #{@user_name}, \t Phone: #{@phone}, \t"
  out_f.write " Barber: #{@barber}, \t"
  out_f.write " Color: #{@color}, \t"
  out_f.write " Date_Time: #{@date_time}\n"
  out_f.close

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
