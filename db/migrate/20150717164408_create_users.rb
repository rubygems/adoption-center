class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :token, null: false
      t.string :email

      t.timestamps null: false
    end
  end
end
