# encoding: UTF-8
class CommentsController < ApplicationController
  before_filter :find_dossier

  def index
    @comments = @dossier.comments
  end
  def create
    @comment = @dossier.comments.create!(params[:comment])

    flash[:notice] = "Commentaire ajouté."
    respond_to do |format|
      format.html {redirect_to dossier_path(@dossier)}
      format.js
    end
  end

  private

  def find_dossier
    @dossier = Dossier.find_by_slug(params[:dossier_id])
  end
end
