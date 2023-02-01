require 'rails_helper'

RSpec.describe 'Posts Index', type: :request do
  before(:example) { get '/users/1/posts' }

  it 'response status is corrrect for posts#index' do
    expect(response).to have_http_status(200)
  end

  it 'correct template is rendered for posts#index' do
    expect(response).to render_template(:show)
  end

  it 'response body has correct text for posts#index' do
    expect(response.body).to include('This is the user posts view')
  end
end
