class GemsAdoption < ActiveRecord::Base
  belongs_to :user
  has_many :adoption_requests
  validates :ruby_gem, :user, presence: true

  scope :search, -> (keyword) { where("gem like ?", "%#{keyword}%") }
end
