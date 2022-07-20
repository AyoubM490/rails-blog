class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :name, presence: true
  validates_numericality_of :posts_counter, only_integer: true, greater_than_or_equal_to: 0

  has_many :posts, foreign_key: "user_id", dependent: :destroy
  has_many :likes, foreign_key: "user_id", dependent: :destroy
  has_many :comments, foreign_key: "user_id", dependent: :destroy

  def most_recent_three_posts
    Post.includes(:user).order(created_at: :desc).limit(3)
  end
end
