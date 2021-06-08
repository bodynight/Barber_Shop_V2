#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter:"sqlite3", database:"barbershop.db"}

class Client < ActiveRecord::Base
end

class Barber < ActiveRecord::Base
end

class Contact < ActiveRecord::Base
end

before do
	@barbers = Barber.order "created_at DESC"
	@contacts = Contact.all
end

get '/' do
	

	erb :index			
end

get '/visit' do
	erb :visit
end


post '/visit' do

	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	row = Client.new :name => @username,
					  :phone => @phone,
					  :datestamp => @datestamp,
					  :barber => @barber,
					  :color => @color 
	row.save				  
	erb "<h2>Спасибо, вы записались</h2>"

end

get '/contacts' do

  erb :contacts
end

post '/contacts' do
	@username = params[:username]
	@email = params[:email]

	row = Contact.new :name => @username, :email => @email
	row.save


<<<<<<< HEAD
=======
get '/barber/:id' do 
	@barber = Barber.find params[:id]
	erb :barber
>>>>>>> 691b875 (вывод информации о Barber на страницу)

erb "Спасибо контакты добавлены"
end