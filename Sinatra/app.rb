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

  @title = 'Спасибо!'
  @message = "Спасибо вам, #{@user_name}, будем ждать Вас."

  out_f = File.open './public/users.txt', 'a'
  out_f.write "User: #{@user_name}, Phone: #{@phone},"
  out_f.write " Barber: #{@barber}"
  out_f.write " Date_Time: #{@date_time}\n"
  out_f.close

  erb :message 
end	

get '/contacts' do
  erb :contacts
end 

get '/memory' do
  out_f = File.open './public/users.txt', 'a'
  erb :memory
end 	
