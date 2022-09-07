class PhotosController < ApplicationController
  # skip_before_action :verify_authenticity_token

  before_action :set_photo, only: %i[show edit update destroy]

  def index
    @photos = Photo.all
  end

  def show
  end

  def new
  end

  def edit
  end

  def update
    @photo.update(photo_params)

    redirect_to photo_url(@photo)
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
    @photo.destroy

    redirect_to photos_url
  end

  private def photo_params
    params.require(:photo).permit(:title, :image_url)
  end

  private def set_photo
    @photo = Photo.find(params[:id])
  end
end
