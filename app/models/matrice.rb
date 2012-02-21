class Matrice
  include Mongoid::Document

  field :name,                          type: String
  has_many :dosages
end
