class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @ads = Ad.all
  end

  def show
    @ad = Ad.find(params[:id])
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.build(ad_params)
    if @ad.save
      redirect_to @ad, notice: 'Anúncio criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
    if @ad.update(ad_params)
      redirect_to @ad, notice: 'Anúncio atualizado com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @ad = Ad.find(params[:id])
    @ad.destroy
    redirect_to ads_path, notice: 'Anúncio excluído com sucesso.'
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :description, :price, :category_id, gallery_images: [])
  end
end
