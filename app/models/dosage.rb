class Dosage
  include Mongoid::Document

  field :concentration, type: String

  belongs_to :dossier
  belongs_to :substance
  belongs_to :matrice
  belongs_to :technique

  def substance_name
    substance.name if substance
  end

  def matrice_name
    matrice.name if matrice
  end

  def technique_name
    technique.name if technique
  end

  def matrice_name=(name)
    self.matrice = Matrice.find_or_create_by(name: name) if name.present?
  end

  def technique_name=(name)
    self.technique = Technique.find_or_create_by(name: name) if name.present?
  end

  def substance_name=(name)
    self.substance = Substance.find_or_create_by(name: name) if name.present?
  end
end
