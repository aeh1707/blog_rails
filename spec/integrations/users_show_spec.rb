require 'rails_helper'

RSpec.describe 'The show user page: ', type: :system do
    before do
        driven_by(:rack_test)
    end
  before :each do
    @user = User.create(name: 'Joseph', photo: '#', bio: 'A web dev', posts_counter: 0)
    @post_one = Post.create(Title: 'Post one', Text: 'Text body one', author_id: @user.id, comment_count: 0,
                            like_counter: 0)
    @post_two = Post.create(Title: 'Post two', Text: 'Text body two', author_id: @user.id, comment_count: 0,
                            like_counter: 0)
    @post_three = Post.create(Title: 'Post three', Text: 'Text body three', author_id: @user.id, comment_count: 0,
                              like_counter: 0)
    @post_three.updated_at_change
  end

  it 'shows profile picture of the user' do
    visit @user_path
    expect(page).to have_selector("img[src='#{@user.photo}']")
  end

  it 'shows username of the user' do
    visit @user_path
    expect(page).to have_content(@user.name)
  end

  it 'shows the number of posts for the user' do
    visit @user_path
    expect(page).to have_content('Number of posts: 3')
  end

it 'show first three posts of the user' do
    visit @user_path
    expect(@user.posts.length).to eq(3)
end

#   it 'shows the users bio' do
#     visit @user_path
#     expect(page).to have_text("A web dev")
#   end



#   it 'show link to view all posts of the user' do
#     visit @user_path
#     expect(page).to have_link('See all posts')
#   end

#   it 'navigate to show post when the user clicks on it' do
#     visit @user_path
#     click_link 'Post one'
#     expect(current_path).to eq user_post_path(@user, @post_one)
#   end

#   it "click on See all posts to redirect to user's post's index page" do
#     visit @user_path
#     click_link 'See all posts'
#     expect(current_path).to eq user_posts_path(@user)
#   end
end