class ArtworkSharesController < ApplicationController
    def art_params
        params.require(:artworkshare).permit(:artwork_id, :viewer_id)
    end
    def create 
        share = ArtworkShare.create(art_params)
        if share.save
            render json: share
        else
            render json: share.errors.full_messages
        end
    end
    def destroy
        ArtworkShare.destropy(params[:id])
    end
end