require "rubygems"
require "sinatra"
require "sinatra/contrib/all"

set :sessions, true

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

end

get '/select_avatar' do
#  if params[:avat].empty?
  	erb :dashboard
#  end
end	

post '/select_avatar' do
#	if params[:avat].empty?
#		@error = "#{session[:guestname]}, please click on an avatar."
#		halt erb(:form)
#	else
		session[:avat] = params[:avat]

#	end
	redirect '/landing'

end

get '/landing' do
	erb :landing
end

post '/landing' do
	session[:avat] = params[:avat]
end

def avatar
	"<img src='session[:avat]'>"
end


