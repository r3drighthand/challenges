get '/users' do
  redirect '/'
end

get '/users/new' do
  erb :'/users/new'
end

get '/users/:id' do
  authenticate!
  current_id = params[:id].to_i
  logger.info current_id.class
  if current_user.id == current_id
    @user = User.find_by(id: session[:user_id])
    erb :'users/show'
  else
    redirect '/404'
  end
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:password]

  if @user.save
    session[:user_id] = @user.id
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    erb :'users/new'
  end
end