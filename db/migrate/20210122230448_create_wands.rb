class CreateWands < ActiveRecord::Migration[6.0]
  def change
    create_table :wands do |t|
      t.string :name
      t.string :wood
      t.integer :length
      t.belongs_to :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
