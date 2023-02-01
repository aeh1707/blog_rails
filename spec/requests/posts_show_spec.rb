require 'rails_helper'

RSpec.describe 'Posts Show', type: :request do
  before(:example) { get '/users/1/posts/1' }

  it 'response status is corrrect for posts#show' do
    expect(response).to have_http_status(200)
  end

  it 'correct template is rendered for posts#show' do
    expect(response).to render_template(:show)
  end

  it 'response body has correct text for posts#show' do
    expect(response.body).to include('This is single user post view')
  end
end
