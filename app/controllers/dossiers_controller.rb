class DossiersController < ApplicationController
  helper_method :date_deces

  def index
    @dossiers = DossierDecorator.decorate(Dossier.all)
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
    @dossier = Dossier.find(params[:id])
  end

  def update
    @dossier = Dossier.find(params[:id])
    if @dossier.update_attributes(params[:dossier])
      redirect_with_flash(@dossier, dossiers_path)
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def date_deces
    @date_deces ||= params[:id] && @dossier.date_deces? ? l(@dossier.date_deces) : ""
  end
end
