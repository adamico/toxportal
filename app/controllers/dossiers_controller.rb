class DossiersController < ApplicationController
  before_filter :authenticate_user!

  helper_method :date_deces
  autocomplete :substance, :name, full: true
  autocomplete :matrice, :name, full: true
  autocomplete :technique, :name, full: true

  def index
    @dossiers = DossierDecorator.decorate(Dossier.all)
  end

  def new
    @dossier = Dossier.new
    11.times do
      @dossier.dosages.build
    end
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
    @dossier = Dossier.find_by_slug(params[:id])
    @comments = @dossier.comments
  end

  def edit
    @dossier = Dossier.find_by_slug(params[:id])
    dosages_count = @dossier.dosages.count rescue 0
    (11 - dosages_count).times do
      @dossier.dosages.build
    end
  end

  def update
    @dossier = Dossier.find_by_slug(params[:id])
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
