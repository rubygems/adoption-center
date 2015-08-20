class CreateRubyGemsUsers < ActiveRecord::Migration
  def change
    create_table :ruby_gems_users, id: false do |t|
      t.belongs_to :ruby_gem, index: true
      t.belongs_to :user, index: true
    end
  end
end
