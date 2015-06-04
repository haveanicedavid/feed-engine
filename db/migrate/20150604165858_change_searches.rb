class ChangeSearches < ActiveRecord::Migration
  def change
    rename_table :searches, :analyses
  end
end
