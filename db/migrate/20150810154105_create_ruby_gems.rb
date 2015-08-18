class CreateRubyGems < ActiveRecord::Migration
  def change
    create_table :ruby_gems do |t|
      t.string :name, null: false, index: true
      t.text :info
      t.string :project_uri

      t.timestamps null: false
    end
  end
end
