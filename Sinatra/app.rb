#encoding: utf-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'
require 'sqlite3'



def get_db
  db = SQLite3::Database.new 'barbershop.db'
  db.results_as_hash = true
  return db
end

configure do
#  db = SQLite3::Database.new 'barbershop.db'
  db = get_db
  db.execute "CREATE TABLE IF NOT EXISTS 
    `Users` 
    (
    `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
    `username`	TEXT,
    `datas`	TEXT,
    `phone`	TEXT,
    `barber`	TEXT,
    `color`	TEXT 
    ) "
    
    db.execute "CREATE TABLE IF NOT EXISTS 
    `Barbers` 
    (
    `id`	INTEGER PRIMARY KEY AUTOINCREMENT,
    `name`	TEXT
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
  @date_time = params[:date_time]
  @phone     = params[:phone]
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
      'datas', 
      'phone', 
      'barber', 
      'color'
    ) 
    VALUES
    (?, ?, ?, ?, ?)",  [@user_name, @date_time, @phone, @barber, @color]
    
  @title = 'Отлично!'
  @message = "Спасибо вам, #{@user_name}. Будем ждать Вас к #{@date_time}."

  erb :message 
end	

get '/contacts' do
  erb :contacts
end 

get '/memory' do
  @file_name = './public/users.txt'
  @arr = []
  in_f = File.open @file_name, 'r'
  puts "Data from file: #{@file_name}" # DEBUG
  while (line = in_f.gets) 	 
    @arr << line.chomp	 
  end 				 
  in_f.close			 
  
  erb :memory
end 	

get '/showusers' do
  db = get_db
  @results = db.execute 'SELECT * FROM Users ORDER BY ID DESC'
  
  erb :showusers
end
