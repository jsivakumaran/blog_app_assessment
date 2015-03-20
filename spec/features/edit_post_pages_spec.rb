require 'rails_helper'
describe "the edit a post process" do
  it "edits a post" do
    post = Post.create(:title => "Hello", :body => "World")
    visit post_path(post)
    click_on "Edit"
    fill_in 'Title', :with => "Howdy"
    click_on 'Update Post'
    expect(page).to have_content 'successfully'
  end
  it "gives an error when title is edited to have an empty string" do
    post = Post.create(:title => "Hello", :body => "World")
    visit post_path(post)
    click_on "Edit"
    fill_in 'Title', :with => ""
    click_on 'Update Post'
    expect(page).to have_content 'Errors'
  end
end
