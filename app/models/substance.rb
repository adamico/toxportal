class Substance
  include Mongoid::Document
  include ActiveAdmin::Mongoid::Patches

  field :name, :type => String

  has_many :dosages
end
