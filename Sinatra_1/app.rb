# filename: app.rb
system('clear') # Linux

require 'sinatra'

# =============================================================== B E G I N =====
get '/' do
  erb :index	# index - это имя файла с представлением
end

def under_construction options
  @title = ' Under construction'
  @message = 'This page is under construction'
  @title = options[:title] if options[:title]
  @message = options[:message] if options[:message]
  erb :message
end

get '/contacts' do
  under_construction :title => 'Contacts', :message => 'Phone: 123'
end

get '/faq' do
  under_construction :title => 'FAQ'
end

get '/something' do
  under_construction :no => ''
end

post '/' do
  @login = params[:aaa]
  @password = params[:bbb]
  
  if @login == 'admin' && @password == 'secret'
    erb :welcome
  elsif @login == 'admin' && @password == 'admin'
    @message = 'Haha, nice try. Access denied yet'
    erb :index
  else  
    @message = 'Access denied'
    erb :index
  end  
end
# =================================================================== E N D =====
