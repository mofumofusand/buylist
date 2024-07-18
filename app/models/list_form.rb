class ListForm
  include ActiveModel::Model

  attr_accessor :content, :quantity, :user_id, :id, :created_at, :updated_at, :tag_name

  validates :content, presence: true
  validates :quantity, presence: true
  validates :tag_name, presence: true

  def save
    list = List.create(content: content, quantity: quantity, user_id: user_id)
    Category.create(tag_name: tag_name, user_id: user_id)
    if tag_name.present?
      category = Category.where(tag_name: tag_name).first_or_initialize
      category.save
      CategoryList.create(list_id: list.id, category_id: category.id)
    end
  end

  def update(params, list)
    list.category_lists.destroy_all
    tag_name = params.delete(:tag_name,)
    category = Category.where(tag_name: tag_name).first_or_initialize if tag_name.present?
    category.save if tag_name.present?
    list.update(params)
    CategoryList.create(list_id: list.id, category_id: category.id) if tag_name.present?
  end
end