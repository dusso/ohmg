class CategoriesController < ApplicationController
  def index
    categories = Category.all.select(:id, :name)
    render json: categories
  end
end
