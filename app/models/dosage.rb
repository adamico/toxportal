class Dosage
  include Mongoid::Document

  field :concentration, type: String

  belongs_to :dossier
  belongs_to :substance
  belongs_to :matrice
  belongs_to :technique
end
