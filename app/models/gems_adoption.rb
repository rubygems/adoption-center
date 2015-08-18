class GemsAdoption < ActiveRecord::Base
  belongs_to :user
  belongs_to :ruby_gem
  has_many :adoption_requests
  validates :ruby_gem, :user, presence: true

  scope :search, -> (keyword) { includes(:ruby_gem).where("ruby_gems.name like ?", "%#{keyword}%").references(:ruby_gem) }

  #scope :search, -> (keyword) { includes(:ruby_gem).where("description like ?", "%#{keyword}%") }
end
