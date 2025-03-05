class CategoriasController < ApplicationController
  def index
    @categorias = Category.where(parent_id: nil)  # Apenas categorias principais
    render json: @categorias
  end

  def subcategorias
    subcategorias = Category.where(parent_id: params[:id].to_i)  # Força ID como número

    if subcategorias.exists?
      render json: subcategorias
    else
      render json: { error: "Nenhuma subcategoria encontrada" }, status: :not_found
    end
  end
end
