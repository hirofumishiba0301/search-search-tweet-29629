class Article < ApplicationRecord
  belongs_to :user
  has_many :goodjobs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  acts_as_taggable
  acts_as_taggable_on :skills, :interests
  
  validates :name, presence: true
  validates :text, presence: true
  enum progress: {
    waiting: 0,
    start: 1,
    tweet: 2,
    }
end
