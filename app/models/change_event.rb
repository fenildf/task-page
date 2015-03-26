class ChangeEvent
  include Mongoid::Document
  include Mongoid::Timestamps
  include TimeScopeMethods

  field :desc,   type: String
  belongs_to :user

  module UserMethods
    extend ActiveSupport::Concern 

    included do
      has_many :change_events
    end
  end
end