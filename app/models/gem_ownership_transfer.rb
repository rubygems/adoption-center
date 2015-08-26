class GemOwnershipTransfer < ActiveRecord::Base
  belongs_to :old_user, class_name: "User"
  belongs_to :new_user, class_name: "User"
  belongs_to :ruby_gem
  validates :ruby_gem, :old_user, :new_user, presence: true
end
