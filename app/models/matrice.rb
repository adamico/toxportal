class Matrice
  include Mongoid::Document
  include ActiveAdmin::MongoMapper::Patches

  field :name,                          type: String
  has_many :dosages
end
