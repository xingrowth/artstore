class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product
  has_many :comment_pictures
  accepts_nested_attributes_for :comment_pictures
  validates :content, presence: true 
end
