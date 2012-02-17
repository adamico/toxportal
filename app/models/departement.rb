class Departement
  include Mongoid::Document

  ## Fields
  field :name
  field :code_postal

  ## Mass assignment protection
  attr_accessible :name, :code_postal

  ## relations
  has_many :dossiers

  ## readers/writers
  attr_reader :cp_name

  def cp_name
    "#{code_postal} (#{name})"
  end
end
