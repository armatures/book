class CreatePhonemes < ActiveRecord::Migration
  def change
    create_table :phonemes do |t|
      t.string :spelling
      t.belongs_to :phoneme_type
    end
  end
end
