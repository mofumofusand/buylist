class CreateCategoryLists < ActiveRecord::Migration[7.0]
  def change
    create_table :category_lists do |t|
      t.references :list, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
