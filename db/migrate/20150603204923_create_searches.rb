class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :keyword
      t.references :user, index: true, foreign_key: true
      t.string :analysis

      t.timestamps null: false
    end
  end
end
