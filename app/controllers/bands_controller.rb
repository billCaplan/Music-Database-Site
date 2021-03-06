class BandsController < ApplicationController

  def index
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.new(band_params)

    if @band.save

      redirect_to bands_url
    else
      render :new
    end
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def edit

  end

  def delete
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def destroy
    self.delete
  end




  private

  def band_params
    params.require(:band).permit(:name)
  end

end
