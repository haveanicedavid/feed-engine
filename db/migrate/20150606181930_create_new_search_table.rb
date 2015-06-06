class CreateNewSearchTable < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :word
      t.boolean :active?, default: true
      t.references :user, index: true, foreign_key: true
    end
  end
end
