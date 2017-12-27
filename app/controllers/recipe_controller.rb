class RecipeController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def edit
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      # redirect_to action: "list"
      redirect_to "index"
    else
      # render action: "new"
      render "new"
    end
  end

  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to "show", id: @recipe
    else
      render "edit"
    end
  end

  def destroy
    @recipe.destroy
    redirect_to "index"
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def recipe_params
      params.require(:recipe).permit(:title, :instructions)
    end
end
