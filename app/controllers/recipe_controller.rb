class RecipeController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def list
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
      redirect_to "list"
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
    redirect_to "list"
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    def recipe_params
      params.fetch(:recipe, {})
    end
end
