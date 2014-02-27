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
	else
	session[:guestname] = params[:guestname]
	"#{session[:guestname]}, you are now ready to use the site."
	erb :dashboard
	end
end

get '/form' do
	erb :dashboard
end

post '/form' do
	if params[:avatar_choice].empty?
		@error = "#{session[:guestname]}, please click on an avatar."
		halt erb(:form)
	else
		session[:avatar_choice] = params[:avatar_choice]
		
	end
end

def avatar
	@avatar = true
end
