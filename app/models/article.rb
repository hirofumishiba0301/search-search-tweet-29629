class Article < ApplicationRecord
  belongs_to :user
  has_many :goodjobs, dependent: :destroy
  
  validates :name, presence: true
  validates :text, presence: true
  enum progress: {
    waiting: 0,
    start: 1,
    tweet: 2,
    }
end
