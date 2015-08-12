class GemsAdoption < ActiveRecord::Base
  belongs_to :user
  validates :gem, :user_id, presence: true

  scope :search, -> (keyword) { where("gem like ?", "%#{keyword}%") } 
end
