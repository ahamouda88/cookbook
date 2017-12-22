class RecipeController < ApplicationController
  def list
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      # redirect_to action: "list"
      redirect_to "list"
    else
      # render action: "new"
      render "new"
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to "show", id: @recipe
    else
      render "edit"
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to "list"
  end

  # Not Used Yet!
  def edit
  end

  def recipe_params
    params.require(:recipe).permit(:title, :instructions)
  end
end
