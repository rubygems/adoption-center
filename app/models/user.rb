class User < ActiveRecord::Base
  has_many :gems_adoptions
  has_many :adoption_requests
  validates :username, :token, presence: true
  end
