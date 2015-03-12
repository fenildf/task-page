class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveTask::UserMethods
  include RecentTask::UserMethods
  include TaskSubmit::UserMethods
  include ChangeEvent::UserMethods
  include FillingTask::UserMethods

  include Gravtastic
  is_gravtastic

  field :name,   type: String
  field :email,  type: String
  field :avatar, type: String

  validates :email, presence: true, uniqueness: true
end