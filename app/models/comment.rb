class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User',
                    foreign_key: 'user_id'
  belongs_to :post, counter_cache: :comments_count

  after_save :update_comments_count

  private

  def update_comments_count
    post.update(comments_count: post.comments.size)
  end
end
