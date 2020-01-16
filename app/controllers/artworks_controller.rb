class ArtworksController < ApplicationController
    def index
        artworks = Artwork.where(artist_id: params[:user_id])
        artworkShares = ArtworkShare.where(viewer_id: params[:user_id])
        render json: artworks + artworkShares
    end
    def create
        art = Artwork.create(params.require(:artwork).permit(:artist_id, :image_url, :title))
        if art.save
            render json: art
        else
            render json: art.errors.full_messages
        end
    end
    def show
        render json: Artwork.where(id: params[:id])
    end
    def update
        art = Artwork.where(id: params[:id]).take!
        params.require(:artwork).permit(:image_url, :artist_id, :title)
        art.image_url = params[:artwork][:image_url]
        art.artist_id = params[:artwork][:artist_id]
        art.title = params[:title]
        if art.save
            render json: art
        else
            render json: art.errors.full_messages
        end
    end
    def destroy
        art = Artwork.where(id: params[:id])
        Artwork.destroy(params[:id])
        render json: art
    end
end