class UsersController < ApplicationController

  get '/signup' do
    if is_logged_in?(session)
      redirect "/tweets"
    else
      erb :'users/signup'
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/signup' do
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect "/tweets"
    else
      redirect "/error"
    end
  end

  get '/logout' do
    session.clear
    redirect "/login"
  end

  helpers do

    def is_logged_in?(session)
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end

  end

end
