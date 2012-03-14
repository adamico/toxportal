class Comment
  include Mongoid::Document
  embedded_in :dossier
  belongs_to :user

  field :body, type: String
end
