class User < ActiveRecord::Base
  validates :username, :token, presence: true
end
