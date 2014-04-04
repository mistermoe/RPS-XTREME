require 'sinatra'
require 'sinatra/reloader'
require_relative '../lib/rps-extreme.rb'
set :bind, '0.0.0.0'

enable :sessions

get '/' do
  erb :index
end

get '/sign-in' do
  erb :sign_in
end

post '/sign-in' do

  @username = params[:username]
  @password = params[:password]

  if (session[:id] != nil)
    @user_id = RPS.DB.get_session(session[:id])
    @session_username = RPS.DB.get_user(@user_id).username
  end


  result = RPS::SignIn.run(username: @username, password: @password)

  if (result.error == :username_doesnt_exist)
    erb :login_error
  else
    session[:id] = result.session_key
    @user_id = RPS.DB.get_session(session[:id])
    @user_matches = RPS.DB.get_matches_by_uid(@user_id)
    @username = RPS.DB.get_user(@user_id).username

    erb :user_home
  end

end


get '/sign-up' do
  erb :sign_up
end

post '/sign-up' do
  @username = params[:username]
  @password = params[:password]

  result = RPS::SignUp.run(username: @username, password: @password)

  if (result.success?)
    result = RPS::SignIn.run(username: @username, password: @password)
    session[:id] = result.session_key

    user_id = RPS.DB.get_session(session[:id])
    @user_matches = RPS.DB.get_matches_by_uid(@user_id)
    @username = RPS.DB.get_user(@user_id)

    erb :user_home
  else
    if (result.error == :user_already_exists)
      "username already created!"
    end
  end

end

post '/create-invite' do
  @away_username = params[:away_player]

  result = RPS::CreateInvite.run(username: @away_username, session_key: session[:id])

  if (result.success?)
      @user_id = RPS.DB.get_session(session[:id])
      @username = RPS.DB.get_user(@user_id).username
      @user_matches = RPS.DB.get_matches_by_uid(@user_id)
      erb :user_home
  end
end

# index: get /invites
# show: get /invites/:id
# new: get /invites/new
# create: post /invites
# edit: get /invites/:id/edit
# update: put /invites/:id
# destroy: delete /invites/:id


post '/accept-invite' do
  @username = params[:away_player]
  result = RPS::AcceptInvite.run(session_key: session[:id], username: @username)





end

# get '/test' do
#   "arf arf!"
# end
