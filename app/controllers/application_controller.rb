class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do #SENDS TO :INDEX TO SHOW ALL CURRENT RECIPES
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do #SENDS YOU TO CREATE A NEW RECIPE
    erb :new
  end

  post '/recipes' do #USES PARAMS FROM :NEW TO CREATE A NEW RECIPE
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    erb :show
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.destroy
    redirect to "/recipes"
  end
end
