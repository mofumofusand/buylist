class List < ApplicationRecord
  belongs_to :user

  has_many :category_lists, dependent: :destroy
  has_many :categories, through: :category_lists

  def self.ransackable_attributes(auth_object = nil)
    ["content", "id", "quantity", "user_id"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["categories"]
  end

end
