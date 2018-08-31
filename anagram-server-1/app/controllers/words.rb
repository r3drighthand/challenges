get '/words/:word' do
  @word = params[:word]
  @word = Word.find_or_initialize_by(phrase: @word)
  @anagrams = @word.anagrams

  # Look in app/views/anagrams/index.erb
  erb :"words/index"
end

post '/words' do
  @word = params[:word][:phrase]
  redirect "/words/#{@word}"
end