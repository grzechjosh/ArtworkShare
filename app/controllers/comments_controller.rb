class CommentsController < ApplicationController
    def comment_params
        params.require(:comment).permit(:user_id, :artwork_id, :body)
    end
    def create
        comment = Comment.create(comment_params)
        if comment.save
            render json: comment 
        else
            render json: comment.errors.full_messages
        end
    end
    def destroy
        comment = Comment.where(id: params[:id])
        Comment.destroy(params[:id])
        render json: comment
    end
    def index
        if params.include?(:user_id)
            render json: Comment.where(user_id: params[:user_id])
        else
            render json: Comment.where(artwork_id: params[:artwork_id])
        end
    end

end