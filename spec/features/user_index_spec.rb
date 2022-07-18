require 'rails_helper'

def create_and_activate_likes(_author, _post, number_of_likes)
  number_of_likes.downto(1).each do |_index|
    Like.create!(author: 'author', post: 'a post')
  end
end

def create_and_activate_comments(author, post, number_of_comments)
  number_of_comments.downto(1).each do |_index|
    Comment.create!(author: 'author', post: 'a post', text: "Comment made by #{author.name} on post #{post.id}")
  end
end

def create_and_activate_posts(author, number_of_posts)
  number_of_posts.downto(1).each do |index|
    Post.create!(author: 'author', title: "Post #{index} by #{author.name}", text: 'My post text')
  end
end

def create_and_activate_user(name)
  user = User.create!(name: 'name', email: "#{name}@example.com", password: '123456', photo: "#{name}.jpg")
  user.confirm
  user.save
  user
end

describe 'Post Index', type: :feature do
  before do
    @name = 'user'
    @user = create_and_activate_user(@name)
    create_and_activate_posts(@user, 1)
    create_and_activate_comments(@user, @user.posts.first, 3)
    create_and_activate_likes(@user, @user.posts.first, 4)
    visit user_post_path(@user, @user.posts.first)
  end

  it "shows the post's title" do
    expect(page).to have_content "Post by #{@user.name}"
  end

  it "shows the posts text's" do
    expect(page).to have_content 'My post text'
  end

  it 'shows who wrote the post' do
    expect(page).to have_content @name
  end

  it 'shows the first comment on a post' do
    expect(page).to have_content "Comment made by #{@user.name} on post #{@user.posts.first.id}"
  end

  it 'shows the number of comments a post has' do
    expect(page).to have_content 'Comment: 3'
  end

  it 'shows the number of likes a post has' do
    expect(page).to have_content 'Likes: 4'
  end

  it 'shows the username of each commenter' do
    expect(page).to have_content @name
  end

  it 'shows the content of each comment' do
    expect(page).to have_content "Comment made by #{@user.name} on post #{@user.posts.last.id}"
  end
end
