require "rails_helper"

describe "Signing in", type: :feature do
  before do
    @name = "user1"
    @email = "user1@example.com"
    @password = "123456"
    user = User.create!(name: @name, email: @email, password: @password)
    user.confirm
    user.save
    visit new_user_session_path
  end

  it "it renders the sign in form with email, password, and log in button" do
    expect(page).to have_field "Email"
    expect(page).to have_field "Password"
    expect(page).to have_button "Log in"
  end

  it "Signing in with no credentials" do
    click_button "Log in"
    expect(page).to have_content "Invalid Email or password."
  end

  it "Signing in with incorrect credentials" do
    fill_in "Email", with: @email
    fill_in "Password", with: @password
    click_button "Log in"
    expect(page).to have_current_path(root_path)
  end
end
