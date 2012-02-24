class Technique
  include Mongoid::Document
  include ActiveAdmin::MongoMapper::Patches

  field :name, :type => String
end
