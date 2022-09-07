class PhotosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
  end

  def edit
    @id = params[:id]
    puts "a1 #{@id}"
  end

  def update
    puts "a2 #{@id}"
    photo = Photo.find(params[:id])
    puts "a3 #{@photo_params}"
    photo.update(photo_params)

    redirect_to photo
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save

    respond_to do |format|
      format.html { redirect_to @photo }
      format.json { render json: @photo, status: :created }
    end
  end

  def destroy
    puts 'oooooooooooo  a5  oooooooooooooooo'
    photo = Photo.find(params[:id])
    photo.destroy

    #redirect_to('/photos')
    
    

    # respond_to do |format|
    #   format.html { redirect_to action: 'index'}
    #   format.json { head :no_content }
    # end
  end

  private def photo_params
    params.require(:photo).permit(:title, :image_url)
  end
end
