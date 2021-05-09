require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

    #renders index page with login form
  get '/' do
    erb :index
  end

  #find the user in the database based on their username.
  #If there is a match, set the session to the user's ID, redirect them to the /account route (using redirect to)
  #use ERB to display the user's data on the page.
  #If there is no match, render the error page.  

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
      erb :account
    else
      erb :error
    end
 

  get '/logout' do
    session.clear
    redirect to '/'

  end

end



