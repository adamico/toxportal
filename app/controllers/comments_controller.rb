# encoding: UTF-8
class CommentsController < ApplicationController
  def create
    @dossier = Dossier.find_by_slug(params[:dossier_id])
    @comment = @dossier.comments.create!(params[:comment])

    flash[:notice] = "Commentaire ajouté."
    respond_to do |format|
      format.html {redirect_to dossier_path(@dossier)}
      format.js
    end
  end
end
