class CategoryList < ApplicationRecord

  after_create :remove_unused_categories
  after_destroy :remove_unused_categories

  belongs_to :category
  belongs_to :list

  private

  def remove_unused_categories
    categories_without_association = Category.where.not(id: CategoryList.pluck(:category_id).uniq)
    categories_without_association.destroy_all
  end

end
