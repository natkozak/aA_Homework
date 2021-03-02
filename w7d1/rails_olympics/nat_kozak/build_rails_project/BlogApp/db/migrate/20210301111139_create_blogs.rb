class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title, null: false
      t.text :body
      t.integer :author_id, null: false
      t.timestamps
    end
    add_index :blogs, :author_id
    add_index :blogs, [:author_id, :title], unique: true
  end
end
