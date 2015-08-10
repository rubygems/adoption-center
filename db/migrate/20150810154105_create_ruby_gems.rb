class CreateRubyGems < ActiveRecord::Migration
  def change
    create_table :ruby_gems do |t|
      t.string :name, index: true, null: false
      t.text :info
      t.string :project_uri

      t.timestamps null: false
    end
  end
end
