class Note < ApplicationRecord
  validates :title, presence: true 
  validates :content, presence: true

  belongs_to :user

  default_scope { where(add_deleted_at: nil) }
end


