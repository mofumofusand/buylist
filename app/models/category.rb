class Category < ApplicationRecord
  belongs_to :user

  has_many :category_lists
  has_many :lists, through: :category_lists

  validates :tag_name, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    ["id", "tag_name"]
  end

 
  def self.ransackable_associations(auth_object = nil)
    ["lists"]
  end
end
