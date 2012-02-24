class Matrice
  include Mongoid::Document
  include Mongoid::Slug
  include ActiveAdmin::Mongoid::Patches

  field :name,                          type: String
  has_many :dosages

  slug :name
end
