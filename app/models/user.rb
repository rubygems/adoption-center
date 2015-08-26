class User < ActiveRecord::Base
  has_many :gems_adoptions
  has_many :adoption_requests
  has_many :ownership_transfers, class_name: "GemOwnershipTransfer", foreign_key: "old_user_id"
  has_many :ownership_receptions, class_name: "GemOwnershipTransfer", foreign_key: "new_user_id"
  has_and_belongs_to_many :ruby_gems
  validates :username, :token, presence: true

  # Add user new gems from RubyGems.org
  def sync_gems(gems)
    user_gem_ids = Array.new
    gems.each do |g|
      ruby_gem = RubyGem.find_or_initialize_by(name: g['name'])
      if ruby_gem.new_record?
        ruby_gem.assign_attributes(info: g['info'], project_uri: g['project_uri'])
        ruby_gem.save!
      end
      user_gem_ids << ruby_gem.id
      self.ruby_gems << ruby_gem unless self.ruby_gems.exists?(ruby_gem)
    end

    # Remove gems that do not longer belongs to the user
    user_gems_to_remove = self.ruby_gems.where('ruby_gems_users.ruby_gem_id NOT IN (?)', user_gem_ids)
    self.ruby_gems.destroy(user_gems_to_remove)
  end

  def owns_gem?(rubygem)
    self.ruby_gems.exists?(rubygem)
  end
end
