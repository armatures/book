class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :spelling
      t.string :pronunciation
      t.integer :syllables

      t.timestamps
    end
  end
end
