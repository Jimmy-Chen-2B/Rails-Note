class Note < ApplicationRecord
  validates :title, presence: true #validates 是類別方法
  validates :content, presence: true
end
