class BillboardsController < ApplicationController
  def index
    @billboards = Billboard.all
  end

  def show
    @billboard = Billboard.find(params[:id])
    @songs = @billboard.songs
  end
  def new
    @billboard = Billboard.new
    render partial: "form"
  end 
  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else 
      render :new
    end 
  end 

  def edit
    @billboard = Billboard.find(params[:id])
    render partial: "form"
  end 

  def update
    @billboard = Billboard.find(params[:id])
    if @billboard.update(billboard_params)
      redirect_to billboards_path
    else
      render :edit
    end
  end
  def destroy
    @billboard = Billboard.find(params[:id])
    @billboard.destroy
    redirect_to billboards_path
  end 


  def new_song
    @billboard = Billboard.find(params[:id])
    @songs = Song.all.where(billboard_id: nil)
  end 

  def add_song
    @billboard = Billboard.find(params[:id])
    @billboard.songs << Song.find(params[:song_id])
    redirect_to billboard_path(@billboard)
  end 
  
  def remove_song
    @billboard = Billboard.find(params[:id])
    Song.find(params[:song_id]).update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end 

  private
  def billboard_params
    params.require(:billboard).permit(:name, :location, :genre)
  end 

end
