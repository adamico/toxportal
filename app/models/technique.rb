class Technique
  include Mongoid::Document
  include ActiveAdmin::Mongoid::Patches

  field :name, :type => String
end
