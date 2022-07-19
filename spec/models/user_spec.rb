require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from US.') }

  describe 'name' do
    before { subject.save }

    it 'should have a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a name' do
      subject.name = 'Ahmed'
      expect(subject).to be_valid
    end
  end

  describe 'posts_counter' do
    before { subject.save }

    it 'should have an integer counter with 0 as the default value' do
      expect(subject.posts_counter).to eql(0)
    end
  end

  describe 'most_recent_three_posts' do
    before { subject.save }

    it 'should have return most recent three posts' do
      @post1 = Post.create(user: subject, title: 'Hello1', text: 'This is my post')

      @post2 = Post.create(user: subject, title: 'Hello2', text: 'This is my post')

      @post3 = Post.create(user: subject, title: 'Hello3', text: 'This is my post')

      @post4 = Post.create(user: subject, title: 'Hello4', text: 'This is my post')

      @post5 = Post.create(user: subject, title: 'Hello5', text: 'This is my post')

      @post6 = Post.create(user: subject, title: 'Hello6', text: 'This is my post')

      @post7 = Post.create(user: subject, title: 'Hello7', text: 'This is my post')

      expect(subject.most_recent_three_posts.length).to eql(3)
      expect(subject.most_recent_three_posts.first).to eql(@post7)
      expect(subject.most_recent_three_posts.last).to eql(@post5)
    end
  end
end
