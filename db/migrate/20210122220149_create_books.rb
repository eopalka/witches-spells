class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :class
      t.string :difficulty
      t.integer :user_id

      t.timestamps
    end
  end
end
