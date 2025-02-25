class LocationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = current_user.locations
    flash[:notice] = t('locations.index_message')  # Exemplo de tradução em uma ação
  end

  def new
    @location = current_user.locations.new
  end

  def create
    @location = current_user.locations.new(location_params)
    if @location.save
      redirect_to locations_path, notice: 'Endereço salvo com sucesso.'
    else
      render :new
    end
  end

  def edit
    @location = current_user.locations.find(params[:id])
  end

  def update
    @location = current_user.locations.find(params[:id])
    if @location.update(location_params)
      redirect_to locations_path, notice: 'Endereço atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @location = current_user.locations.find(params[:id])
    @location.destroy
    redirect_to locations_path, notice: 'Endereço excluído com sucesso.'
  end

  private

  def location_params
    params.require(:location).permit(:street, :number, :npa, :canton)
  end
end
