class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :content
      t.integer :entry_id

      t.timestamps
    end
    add_index :comments, [:user_id, :created_at]
    add_index :comments, [:entry_id, :created_at]
  end
end
