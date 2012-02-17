class Dossier
  include Mongoid::Document

  ## Fields
  field :code,              type: String, null: false

  ## Validations
  validates_presence_of :code
  validates_uniqueness_of :code

  ## Mass assignment protection
  attr_accessible :code
end
