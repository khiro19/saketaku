class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites , dependent: :destroy
  has_many :likes, through: :favorites, source: :micropost
  has_many :reverse_of_favorite, class_name: 'Favorite', foreign_key: 'micropost_id'
  has_many :liked, through: :reverse_of_favorite, source: :user

  
  
end
