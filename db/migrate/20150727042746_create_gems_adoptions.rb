class CreateGemsAdoptions < ActiveRecord::Migration
  def change
    create_table :gems_adoptions do |t|
      t.integer :user_id, null: false
      t.string :gem, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
