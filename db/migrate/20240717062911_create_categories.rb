class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :tag_name, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
    add_index :categories, :tag_name, unique: true
  end
end
