require 'rails_helper'

RSpec.describe Post, type: :model do
  before { @user = User.create(name: 'Jerry', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from US.') }
  subject { Post.new(author: @user, title: 'Hello1', text: 'This is my 1 post') }

  describe 'title' do
    before { subject.save }

    it 'should have a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'should have a short title' do
      subject.title = 'Hello'
      expect(subject).to be_valid
      subject.title = 'Hello' * 259
      expect(subject).to_not be_valid
    end
  end

  describe 'likes_count' do
    before { subject.save }

    it 'should have an integer counter with 0 as the default value' do
      expect(subject.likes_count).to eql(0)
    end
  end

  describe 'comments_count' do
    before { subject.save }

    it 'should have an integer counter with 0 as the default value' do
      expect(subject.comments_count).to eql(0)
    end
  end

  describe 'most_recent_five_comments' do
    before { subject.save }

    it 'should have return the most recent five comments' do
      @comment1 = Comment.create(post: subject, author: @user, text: 'comment 1')

      @comment2 = Comment.create(post: subject, author: @user, text: 'comment 2')

      @comment3 = Comment.create(post: subject, author: @user, text: 'comment 3')

      @comment4 = Comment.create(post: subject, author: @user, text: 'comment 4')

      @comment5 = Comment.create(post: subject, author: @user, text: 'comment 5')

      @comment6 = Comment.create(post: subject, author: @user, text: 'comment 6')

      @comment7 = Comment.create(post: subject, author: @user, text: 'comment 7')

      expect(subject.most_recent_five_comments.length).to eql(5)
      expect(subject.most_recent_five_comments.first).to eql(@comment7)
      expect(subject.most_recent_five_comments.last).to eql(@comment3)
    end
  end
end
