class Comment
  include Mongoid::Document
  embedded_in :dossier

  field :body, type: String
  field :user_id, type: String

  def user
    if user_id
      username = User.find(user_id).name
      "#{username}"
    end
  end
end
