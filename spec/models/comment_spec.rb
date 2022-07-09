require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @user = User.create(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from US.')
    @post = Post.new(author: @user, title: 'Hello1', text: 'This is my 1 post')
  end
  subject { Comment.create(post: @post, author: @user, text: 'my comment') }

  describe 'after_save' do
    before { subject.save }

    it 'should have update the comments_count of the post' do
      expect(@post.comments_count).to eql(1)
    end
  end
end
