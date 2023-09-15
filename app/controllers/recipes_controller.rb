class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true)
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe created successfully.'
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = 'Recipe creation failed.'
      render :new # Changed 'redirect_to' to 'render'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      flash[:notice] = 'Recipe was successfully deleted.'
    else
      flash[:alert] = 'Access denied: You are not allowed to delete this recipe.'
    end
    redirect_to recipes_path # Removed the comma at the end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @toggle_recipe_public = params[:toggle_recipe_public]
    return unless @toggle_recipe_public && @recipe.user == current_user

    @recipe.update(public: !@recipe.public)
    flash[:notice] = @recipe.public ? 'Recipe is now public.' : 'Recipe is now private.'
    redirect_to recipe_path(@recipe)
  end

  def toggle_recipe_public
    @recipe = Recipe.find(params[:id])

    if @recipe.user == current_user
      @recipe.update(public: !@recipe.public)
      flash[:notice] = @recipe.public ? 'Recipe is now public.' : 'Recipe is now private.'
    else
      flash[:alert] = 'You do not have permission to toggle this recipe.'
    end

    redirect_to recipe_path(@recipe) # Added @recipe to the redirect
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
