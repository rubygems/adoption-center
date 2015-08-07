class User < ActiveRecord::Base
  has_many :gems_adoptions
  has_many :adoptions_requests
  validates :username, :token, presence: true
  end
