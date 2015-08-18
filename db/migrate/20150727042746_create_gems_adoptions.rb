class CreateGemsAdoptions < ActiveRecord::Migration
  def change
    create_table :gems_adoptions do |t|
      t.integer :user_id, null: false, index: true
      t.integer :ruby_gem_id, null: false, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end
