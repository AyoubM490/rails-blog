class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id', counter_cache: :comments_count

  after_save :update_comments_count

  private

  def update_comments_count
    post.update(comments_count: post.comments.size)
  end
end
