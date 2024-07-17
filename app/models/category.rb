class Category < ApplicationRecord
  belongs_to :user

  validates :tag_name, presence: true
end
