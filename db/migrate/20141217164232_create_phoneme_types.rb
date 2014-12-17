class CreatePhonemeTypes < ActiveRecord::Migration
  def up
    create_table :phoneme_types do |t|
      t.string :phoneme_type
    end
  end

  def down
    drop_table :phoneme_types
  end
end
