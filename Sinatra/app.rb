#encoding: utf-8
require 'rubygems'
require 'sinatra'
#require 'sinatra/reloader'

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
