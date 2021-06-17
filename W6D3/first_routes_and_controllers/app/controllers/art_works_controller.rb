class ArtWorksController < ApplicationController
  def index
    # @art_works = ArtWork.find(params[:user_id])
    user = User.find(params[:user_id])
    if user.artworks.empty?
      @art_works = user.shared_artworks
    else
      @art_works = user.artworks #+ user.shared_artworks
    end
    render json: @art_works
  end

  def show
    @art_work = ArtWork.find(params[:id])
    render json: @art_work
  end

  def create
    art_work = ArtWork.new(art_work_params)
    if art_work.save
      render json: art_work
    else
      render json: art_work.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    @art_work = ArtWork.find(params[:id])
    if @art_work.update(art_work_params)
      redirect_to art_work_url(@art_work)
    else
      render json: @art_work.errors.full_messages, status: 422
    end
  end

  def destroy
    @art_work = ArtWork.find(params[:id])
    @art_work.destroy
    redirect_to art_works_url
  end

  private
  def art_work_params
    params.require(:art_work).permit(:artist_id, :title, :image_url)
  end
end