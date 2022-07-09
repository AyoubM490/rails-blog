require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @user = User.create(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from US.')
    @post = Post.new(author: @user, title: 'Hello1', text: 'This is my 1 post')
  end
  subject { Like.create(post: @post, author: @user) }

  describe 'after_save' do
    before { subject.save }

    it 'should have update the likes_count of the post' do
      expect(@post.likes_count).to eql(1)
    end
  end
end
