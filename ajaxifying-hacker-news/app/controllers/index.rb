get '/' do
  redirect '/posts'
end

get '/posts' do
  @posts = Post.all
  erb :index
end

post '/posts/:id/vote' do
  post = Post.find(params[:id])
  post.votes.create(value: 1)
  if request.xhr?
    content_type :json
    #telling client we are sending you json back
    {votes_count: post.points}.to_json
  else
    redirect "/posts"
  end
end

delete '/posts/:id' do
  post = Post.find(params[:id])
  post.destroy
  if request.xhr?
    status 204
  else
    redirect '/posts'
  end
end

post '/posts' do
  post = Post.new( title: params[:title],
               username: Faker::Internet.user_name,
               comment_count: rand(1000) )
  if post.save
    if request.xhr?
      erb :'/partials/_post', layout: false, locals: {post: post}
    else
      redirect '/posts'
    end
  else
    if request.xhr?
      status 422
      @errors = post.errors
      erb :'/partials/_errors', layout: false
    else
      @errors = post.errors
      @posts = Post.all
      erb :'/index'
    end
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post
end
