class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name
      t.string :type
      t.integer :difficulty
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
