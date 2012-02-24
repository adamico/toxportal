class Technique
  include Mongoid::Document
  include Mongoid::Slug
  include ActiveAdmin::Mongoid::Patches

  field :name, :type => String
  slug :name
end
