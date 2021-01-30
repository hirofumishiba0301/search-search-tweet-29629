class User < ApplicationRecord
  has_many :articles
  has_one_attached :user_image
  has_many :follow_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :follows, through: :follow_relationships
  has_many :follower_relationships, foreign_key: "follow_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships


  def follow?(other_user)
    follow_relationships.find_by(follow_id: other_user.id)
  end

  def follow_create!(other_user)
    follow_relationships.create!(follow_id: other_user.id)
  end

  def follow_destroy!(other_user)
    follow_relationships.find_by(follow_id: other_user.id).destroy
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :nickname, presence: true
  validates :birthday, presence: true
end
