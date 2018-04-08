class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  #Create
  get '/recipes/new' do 
  	erb :new
  end

  #Create
  post '/recipes' do
  	@recipe = Recipe.create(params)
  	redirect to "/recipes/#{@recipe.id}"

  end

  #Read
  get '/' do
	@recipes = Recipe.all
    erb :index
  end

  #Read
  get '/recipes' do
  	@recipes = Recipe.all
  	erb :index
  end
  #Read
  get '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	erb :show
  end

  #Update
  get '/recipes/:id/edit' do
  	@recipe = Recipe.find(params[:id])
  	erb :edit
  end

  #Update
  patch '/recipes/:id' do
  	@recipe = Recipe.find(params[:id])
  	@recipe.update(
  		name: params[:name],
  		ingredients: params[:ingredients],
  		cook_time: params[:cook_time]
  		)
  	redirect to "/recipes/#{@recipe.id}"
  end


  #Destroy
  delete '/recipes/:id/delete' do
  	 Recipe.find(params[:id]).destroy
  	 redirect to "/recipes"
  end


end