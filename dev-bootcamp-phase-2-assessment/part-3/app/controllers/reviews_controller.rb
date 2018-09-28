post '/restaurants/:id/reviews' do
  authenticate!
  @restaurant = Restaurant.find_by(id: params[:id])
  @review = @restaurant.reviews.new(params[:review])
  @review.reviewer = User.find_by(id: session[:user_id])

  if @review.save
    redirect "/restaurants/#{@restaurant.id}"
  else
    @errors = @review.errors.full_messages
    erb :'restaurants/show'
  end
end
