get '/home' do
  @all_entries = Entry.all

  erb :home
end

get '/entry' do
  p "#{params[:id]}"
  @single_entry = Entry.find(params[:id])

  erb :entry
end

get '/new-entry' do
  erb :new_entry
end

post '/save-entry' do
  new_entry = Entry.new(:title => params[:entry_title], :body => params[:entry_body])
  if new_entry.valid?
    new_entry.save
    redirect '/home'
  else
    @errors = new_entry.errors.full_messages
    erb :new_entry
  end
end
