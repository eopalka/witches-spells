class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.text :description
      t.integer :difficulty_level
      t.integer :power_level
      t.integer :book_id

      t.timestamps
    end
  end
end
