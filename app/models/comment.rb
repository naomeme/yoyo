class Comment < ActiveRecord::Base
  belongs_to :topic

  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 140 }
end
