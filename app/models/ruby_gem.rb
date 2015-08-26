class RubyGem < ActiveRecord::Base
  has_one :gems_adoption
  has_many :gem_ownership_transfers
  has_and_belongs_to_many :users
  validates :name, presence: true, uniqueness: true
end
