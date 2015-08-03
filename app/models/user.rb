class User < ActiveRecord::Base
  validates :username, :token, presence: true

  has_many :gems_adoptions
end
