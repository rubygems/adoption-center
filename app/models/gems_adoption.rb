class GemsAdoption < ActiveRecord::Base
  belongs_to :user
  validates :gem, :user_id, presence: true
end
