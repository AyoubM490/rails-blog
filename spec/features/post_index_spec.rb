require 'rails_helper'

def create_and_activate_likes(_author, _post, number_of_likes)
  number_of_likes.downto(1).each do |_index|
    Like.create!(author: 'author', post: 'some post')
  end
end

def create_and_activate_comments(author, post, number_of_comments)
  number_of_comments.downto(1).each do |index|
    Comment.create!(author: 'author', post: 'some post',
                    text: "Comment #{index} made by #{author.name} on post #{post.id}")
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
    create_and_activate_posts(@user, 10)
    create_and_activate_comments(@user, @user.posts.first, 3)
    visit user_posts_path(@user)
  end

  it 'shows photos of all the users' do
    expect(page).to have_css "img[src='#{@name}.jpg']"
  end

  scenario 'shows username of all the users' do
    expect(page).to have_content @name
  end

  it 'shows number of posts that the user has' do
    expect(page).to have_content 'Number of posts: 10'
  end

  it "shows the posts title's" do
    expect(page).to have_content "Post 1 by #{@user.name}"
    expect(page).to have_content "Post 5 by #{@user.name}"
    expect(page).to have_content "Post 10 by #{@user.name}"
  end

  it "shows the posts text's" do
    expect(page).to have_content 'My post text'
  end

  it 'shows the first comment on a post' do
    expect(page).to have_content "Comment made by #{@user.name} on post #{@user.posts.first.id}"
  end

  it 'shows the number of comments a post has' do
    expect(page).to have_content 'Comment: 3'
  end

  it 'gets redirected to post page after user clicks on a post' do
    click_link "Post 1 by #{@name}"

    expect(page).to have_current_path(user_post_path(@user, @user.posts.last))
  end
end
