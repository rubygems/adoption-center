class AddStatusToGemsAdoptions < ActiveRecord::Migration
  def change
    add_column :gems_adoptions, :status, :integer, :default => 0
  end
end
