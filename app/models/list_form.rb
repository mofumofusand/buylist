class ListForm
  include ActiveModel::Model

  attr_accessor :content, :quantity, :user_id, :id, :created_at, :updated_at

  validates :content, presence: true
  validates :quantity, presence: true

  def save
    List.create(content: content, quantity: quantity, user_id: user_id)
  end

  def update(params, list)
    list.update(params)
  end
end