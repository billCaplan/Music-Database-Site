class AlbumsController < ApplicationController

  def index
    redirect_to bands_url
  end



  def new
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to "/bands/"
    else
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])

    render :show
  end

  private

  def album_params
    params.require(:album).permit(:name, :band_id, :album_type)
  end

end
