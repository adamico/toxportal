class DossiersController < ApplicationController
  def index
    @dossiers = Dossier.all
  end

  def new
    @dossier = Dossier.new
  end

  def create
    @dossier = Dossier.new(params[:dossier])
    if @dossier.save
      redirect_with_flash(@dossier, dossiers_path)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
