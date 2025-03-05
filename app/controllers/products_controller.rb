class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: "Produto criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def dynamic_fields
    @category = Category.find(params[:category_id])
    @fields = @category.category_fields

    respond_to do |format|
      format.html { render partial: "products/dynamic_fields", locals: { fields: @fields } }
    end
  end

  def load_subcategories
    @subcategories = Category.where(parent_id: params[:category_id])
  
    respond_to do |format|
      format.html { render partial: "products/subcategories", locals: { subcategories: @subcategories } }
    end
  end  

  private

  def product_params
    params.require(:product).permit(:title, :description, :category_id, :price, :images_count)
  end
end