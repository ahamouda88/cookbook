class Recipes < ActiveRecord::Migration[5.1]
  def self.up
    create_table :recipes do |r|
      r.string :title, limit: 32, null: false
      r.text :instructions, null: false
    end
  end
  def self.down
    drop_table :recipes
  end
end
