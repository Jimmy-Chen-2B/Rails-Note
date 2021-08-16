class Note < ApplicationRecord
  validates :title, presence: true # validates 是類別方法
  validates :content, presence: true

  default_scope { where(deleted_at: nil) }
end


