class User < ActiveRecord::Base
  belongs_to :team
  has_many :environments
end
