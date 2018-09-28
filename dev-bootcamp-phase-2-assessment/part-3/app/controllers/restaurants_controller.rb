get '/restaurants' do
  @restaurants = Restaurant.all
  erb :'restaurants/index'
end

get '/restaurants/new' do
  authenticate!
  @states = Restaurant.states
  erb :'/restaurants/new'
end

post '/restaurants' do
  authenticate!
  @restaurant = Restaurant.new(params[:restaurant])
  @restaurant.page_creator = current_user

  if @restaurant.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @states = Restaurant.states
    @errors = @restaurant.errors.full_messages
    erb :'restaurants/new'
  end
end

get '/restaurants/:id' do
  @restaurant = Restaurant.find_by(id: params[:id])
  erb :'/restaurants/show'
end

get '/restaurants/:id/edit' do
  authenticate!
  if current_user.id == params[:id].to_i
    @restaurant = Restaurant.find_by(id: params[:id])
    erb :'/restaurants/edit'
  else
    redirect '/404'
  end
end

put '/restaurants/:id' do
  authenticate!
  if current_user.id == params[:id].to_i
    @restaurant = Restaurant.find_by(id: params[:id])
    @restaurant.update_attributes(params[:restaurant])
    redirect "/restaurants/#{@restaurant.id}"
  else
    redirect '/404'
  end
end

delete '/restaurants/:id' do
  authenticate!
  if current_user.id == params[:id].to_i
    @restaurant = Restaurant.find_by(id: params[:id])
    Restaurant.delete(@restaurant)
    redirect '/'
  else
    redirect '/404'
  end
end
