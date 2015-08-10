class AdoptionRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :gems_adoption
  validates :gems_adoption, :user, presence: true
end
