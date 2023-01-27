require 'rails_helper'

RSpec.describe Like, type: :model do
  first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  first_post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
  subject { Like.create(post: first_post, author: first_user) }

  it 'first user id to match like author id' do
    expect(subject.author_id).to eq(first_user.id)
  end

  it 'first post id to match like post id' do
    expect(subject.post_id).to eq(first_post.id)
  end
end
