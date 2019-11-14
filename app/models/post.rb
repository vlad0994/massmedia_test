class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy

  mount_uploader :file, FileUploader

  validates :name, uniqueness: true, presence: true
  validates :content, presence: true
end
