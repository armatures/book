class AddIndexToWordTable < ActiveRecord::Migration
  def change
    add_index :words, :pronunciation
  end
end
