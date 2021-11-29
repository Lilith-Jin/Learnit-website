class Review < ApplicationRecord
  belongs_to :user
  validates :rating, :title, :content, presence: true 
end
