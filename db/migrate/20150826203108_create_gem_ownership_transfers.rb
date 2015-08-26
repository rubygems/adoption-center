class CreateGemOwnershipTransfers < ActiveRecord::Migration
  def change
    create_table :gem_ownership_transfers do |t|
      t.integer :old_user_id, null: false, index: true
      t.integer :new_user_id, null: false, index: true
      t.integer :ruby_gem_id, null: false, index: true

      t.timestamps null: false
    end
    add_foreign_key :gem_ownership_transfers, :users, column: :old_user_id
    add_foreign_key :gem_ownership_transfers, :users, column: :new_user_id
  end
end
