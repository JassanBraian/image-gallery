class PhotosController < ApplicationController
  before_action :set_photo, only: %i[show edit update destroy]
  layout "landing"

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    session[:intentos] = session[:intentos] ? session[:intentos] + 1 : 1
  end

  def edit
  end

  def update
    @photo.update(photo_params)

    redirect_to @photo
  end

  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Todo salio bien" }
        format.json { render json: @photo, status: :created }
      else
        format.html {
          redirect_back fallback_location: photos_path,
                        notice: "Algo salio mal #{@photo.errors.full_messages.to_sentence}"
        }
      end
    end
  end

  def destroy
    @photo.destroy

    redirect_to photos_path
  end

  private def photo_params
    params.require(:photo).permit(:title, :image_url)
  end

  private def set_photo
    @photo = Photo.find(params[:id])
  end
end
