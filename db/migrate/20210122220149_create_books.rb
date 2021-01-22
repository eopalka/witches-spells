class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :genre
      t.integer :difficulty
      t.integer :user_id
      t.integer :spell_id

      t.timestamps
    end
  end
end
