class NotesController < ApplicationController

  def index
    render :index
  end

  def new
    @note = Note.new
    render :new
  end

  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    @note.track_id = params[:track_id]

    if @note.save

      redirect_to "/tracks/#{params[:track_id]}/"
    else
      render :new
    end
  end

  def show
    @note = Note.find(params[:id])
    render :show
  end

  def edit

  end

  def delete
    @note = Note.find_by(id: params[:id])
    @note.destroy
    redirect_to tracks_url
  end

  def destroy
    self.delete
  end




  private

  def note_params
    params.require(:note).permit(:note_body)
  end
end
