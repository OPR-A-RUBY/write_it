require 'sinatra'
system 'clear'

get '/' do
    erb :index
end

post '/' do 
    @user_name = params[:user_name]
    @phone     = params[:phone]
    @date_time = params[:date_time]

    @title = 'Спасибо!'
    @message = "Спасибо вам, #{@user_name}, будем ждать Вас."

    out_f = File.open './public/users.txt', 'a'
    out_f.write "User: #{@user_name}, Phone: #{@phone},"
    out_f.write " Date_Time: #{@date_time}\n"
    out_f.close

    erb :message
end
