class CreateAdoptionsRequests < ActiveRecord::Migration
  def change
    create_table :adoptions_requests do |t|
      t.integer :gems_adoption_id, null: false
      t.integer :user_id, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
