class GemsAdoption < ActiveRecord::Base
  belongs_to :user
  has_many :adoption_requests
  validates :gem, :user_id, presence: true

  def self.search(search)
	  where("gem like ?", "%#{search}%") 
	end

end
