require 'rails_helper'

describe "the add a post process" do
  it "adds a new post" do
    visit posts_path
    click_on "Add Post"
    fill_in 'Title', :with => "Blog Post Title Testing 1"
    click_on "Create Post"
    expect(page).to have_content 'successfully'
  end

  it "gives error when no title is entered" do
    visit posts_path
    click_on "Add Post"
    fill_in 'Title', :with => ''
    click_on "Create Post"
    expect(page).to have_content 'Errors'
  end
end
