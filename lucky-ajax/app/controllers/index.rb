get '/' do
  erb :index
end

post '/rolls' do
  @die = Die.new(params[:sides].to_i)
  if request.xhr?
    erb :"_die", layout: false
  else
    erb :index
  end
end
