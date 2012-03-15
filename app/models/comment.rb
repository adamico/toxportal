class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :dossier
  belongs_to :user

  field :body, type: String

  def user_name
    if user
      user.name
    end
  end
end
