class GemsAdoption < ActiveRecord::Base
  belongs_to :user
  has_many :adoption_requests
  validates :gem, :user_id, presence: true

  scope :search, -> (keyword) { where("gem like ?", "%#{keyword}%") } 
end
