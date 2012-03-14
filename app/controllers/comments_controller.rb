class CommentsController < ApplicationController
  def create
    @dossier = Dossier.find_by_slug(params[:dossier_id])
    @comment = @dossier.comments.create(params[:comment])
    if @comment.save
      redirect_with_flash(@comment, dossiers_path)
    end
  end
end
