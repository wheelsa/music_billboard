class SongsController < ApplicationController
  before_action :set_artist
  def index
    # @billboard = Billboard.find[:billboard_id]
    @songs = @artist.songs
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
    render partial: "form"
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to artist_songs_path
    else
      render :edit
    end
  end

  def new
    @song = @artist.songs.new
    render partial: 'form'
  end

  def create
    @song = @artist.songs.new(song_params)
    if @song.save
      redirect_to artist_songs_path(@artist,@song)
    else 
      render :new
    end 
  end 

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to artist_songs_path(@artist)
  end 

  private
  def song_params
    params.require(:song).permit(:name, :genre, :length)
  end 


  private
  def set_artist
    @artist = Artist.find(params[:artist_id])
  end 
end
