class List < ApplicationRecord
  belongs_to :user

  has_many :category_lists
  has_many :categories, through: :category_lists
end
