class CommentsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @comment = Comment.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @photo.comments.create(comment_params, user_id: current_user.id)
    redirect_to '/photos'
  end

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
