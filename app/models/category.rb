class Category < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, uniqueness: true, presence: true
end
