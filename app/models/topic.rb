class Topic < ActiveRecord::Base
  has_many :comments

  validates :subject, presence: true, length: { maximum: 140 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :body, presence: true

  paginates_per 5
end
