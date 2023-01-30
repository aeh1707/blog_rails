require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.create(title: 'Hello World', text: 'This is the first post of the blog', author_id: 1) }

  it 'title should be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should not be too long' do
    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments counter should be an integer' do
    subject.comments_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'comments counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes counter should be an integer' do
    subject.likes_counter = 'one'
    expect(subject).to_not be_valid
  end

  it 'likes counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
