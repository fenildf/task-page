class TaskSubmit
  include Mongoid::Document
  include Mongoid::Timestamps

  field :desc,   type: String
  belongs_to :user
end