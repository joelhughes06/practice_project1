require "rubygems"
require "sinatra"
require "sinatra/contrib/all"

set :sessions, true


helpers do

	def card_image(card)
		suit = case card[0]
			when 'C' then 'clubs'
			when 'D' then 'diamonds'
			when 'H' then 'hearts'
			when 'S' then 'spades'
		end

		value = card[1]
		if ['J', 'Q', 'K', 'A'].include?(value)
			value = case card[1]
			when 'J' then 'jack'
			when 'Q' then 'queen'
			when 'K' then 'king'
			when 'A' then 'ace'
			end
		end

		"<img src='/images/cards/#{suit}_#{value}.jpg' class='card_image'>"
	end

end


get '/' do
		redirect '/form'
end

get '/home' do
		redirect '/form'
end

get '/form' do

	erb :form

end

post '/form' do
	if params[:guestname].empty?
		@error = "Name is required."
		halt erb(:form)
	end	
	session[:guestname] = params[:guestname]
	redirect '/select_avatar'

	erb :form

end

get '/select_avatar' do
#  if params[:avat].empty?
  	erb :dashboard
#  end
end	

post '/select_avatar' do

		session[:avat] = params[:avat]

	redirect '/landing'

end

get '/landing' do

	suits = ['C', 'D', 'H', 'S']
	values = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']
	session[:deck] = suits.product(values).shuffle!

	session[:guestcards] = []
	session[:guestcards] << session[:deck].pop

	erb :form

	erb :landing
end

post '/landing' do
	session[:avat] = params[:avat]
	session[:guestcards] << session[:deck].pop
end

post '/landing/nextcard' do
	session[:guestcards] << session[:deck].pop
	erb :landing
end

post '/landing/running_tally' do
	session[:guestcards]
	@running_tally += value
	erb :landing
end
