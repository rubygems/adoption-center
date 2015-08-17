class User < ActiveRecord::Base
  has_many :gems_adoptions
  has_many :adoption_requests
  has_and_belongs_to_many :ruby_gems
  validates :username, :token, presence: true

  def sync_gems(gems)
    ruby_gem_array = Array.new
    gems.each do |g|
      ruby_gem = RubyGem.find_or_initialize_by(name: g['name'])
      if ruby_gem.new_record?
        ruby_gem.assign_attributes(info: g['info'], project_uri: g['project_uri'])
        ruby_gem.save!
        ruby_gem_array << ruby_gem.id
        self.ruby_gems << ruby_gem unless self.ruby_gems.exists?(ruby_gem)
      end
    end
    ruby_gems = self.ruby_gems.where('ruby_gems_users.ruby_gem_id NOT IN (?)', ruby_gem_array)
    self.ruby_gems.destroy(ruby_gems)
  end
end
