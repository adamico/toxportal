class Dossier
  include Mongoid::Document

  ## Fields
  field :code,              type: String, null: false
  field :date_deces,        type: Date

  ## Validations
  validates_presence_of :code
  validates_uniqueness_of :code

  ## Mass assignment protection
  attr_accessible :code, :date_deces, :departement_id

  ## relations
  belongs_to :departement
end
