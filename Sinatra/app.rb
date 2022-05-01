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

get '/create' do
	erb :create
end 	

get '/contacts' do
	erb :contacts
end 

get '/memory' do
	erb :memory
end 	