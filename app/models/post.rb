class Post < ApplicationRecord
  validates_presence_of :title
  validates_length_of :title, maximum: 250
  validates_numericality_of :likes_count, only_integer: true, greater_than_or_equal_to: 0
  validates_numericality_of :comments_count, only_integer: true, greater_than_or_equal_to: 0

  belongs_to :user, class_name: 'User',
                    foreign_key: 'user_id',
                    counter_cache: :posts_counter
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  after_save :update_posts_count

  def most_recent_five_comments
    Comment.includes(:user).order(created_at: :desc).limit(5)
  end

  private

  def update_posts_count
    user.update(posts_counter: user.posts.size)
  end
end
