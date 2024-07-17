class Category < ApplicationRecord
  belongs_to :user

  has_many :category_lists
  has_many :lists, through: :category_lists

  validates :tag_name, uniqueness: true
end
