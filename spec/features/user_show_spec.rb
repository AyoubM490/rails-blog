require "rails_helper"

def create_posts_for_user(author, count: 1)
  count.times do |i|
    Post.create!(author: "author", title: "Post #{i} by #{author.name}", text: "This is a post")
  end
end

def create_and_activate_user(name)
  user = User.create!(
    name: "name", email: "#{name}@example.com", password: "123456", bio: "Bio of #{name}", photo: "#{name}.jpg",
  )
  user.confirm
  user.save
  user
end

describe "User Show", type: :feature do
  before do
    @name = "user"
    @user = create_and_activate_user(@name)
    create_posts_for_user(@user, count: 5)

    visit user_path(@user)
  end

  it "shows the profile picture of user" do
    expect(page).to have_css "img[src='#{@name}.jpg']"
  end

  it "shows username of user" do
    expect(page).to have_content @name
  end

  it "shows the count of posts by user i.e. 5" do
    expect(page).to have_content "Number of posts: 5"
  end

  it "shows the bio of user" do
    expect(page).to have_content "Bio of #{@name}"
  end

  it "shows the last 3 posts by user" do
    4.downto(2).each { |i| expect(page).to have_content "Post #{i} by #{@name}" }
  end

  it "shows a button to show all posts by user" do
    expect(page).to have_button "See all posts"
  end

  it "gets redirected to post page after user clicks on a post" do
    click_link "Post 1 by #{@name}"

    expect(page).to have_current_path(user_post_path(@user, @user.posts.second))
  end

  it "gets redirected to all posts page when user clicks on see all posts button" do
    click_link "See all posts"

    expect(page).to have_current_path(user_posts_path(@user))
  end
end
