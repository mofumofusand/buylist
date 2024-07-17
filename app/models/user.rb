class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :lists

  validates :nickname, presence: true

  PASSWORD_REGEX = /\A[a-z\d]{6,}\Z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX

end
