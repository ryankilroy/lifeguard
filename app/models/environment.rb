class Environment < ActiveRecord::Base
  belongs_to :user

  delegate :team, to: :user
end
