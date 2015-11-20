class TracksController < ApplicationController



  def new
    @track = Track.new
    render :new
  end

  def create
    @track = Track.new(track_params)

    if @track.save
      redirect_to "/bands/"
    else
      render :new
    end
  end

  def show
    @track = Track.find_by(id: params[:id])
    render :show
  end

  private

  def track_params
    params.require(:track).permit(:name, :lyrics, :album_id)
  end

end
