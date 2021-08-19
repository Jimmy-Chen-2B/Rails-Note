class Note < ApplicationRecord
  validates :title, presence: true 
  validates :content, presence: true

  belongs_to :user
  has_many :comments
  has_many :bookmarks
  has_many :users, through: :bookmarks
  
  default_scope { where(deleted_at: nil) }
end


