class GemsAdoption < ActiveRecord::Base
  enum status: [ :open, :closed ]

  belongs_to :user
  belongs_to :ruby_gem
  has_many :adoption_requests
  validates :ruby_gem, :user, presence: true

  default_scope { where(status: 'open') }

  scope :search, -> (keyword) { includes(:ruby_gem).where("ruby_gems.name like ?", "%#{keyword}%").references(:ruby_gem) }
end
