class AdoptionsRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :gems_adoption
  validates :gems_adoption_id, :user_id, presence: true
end
