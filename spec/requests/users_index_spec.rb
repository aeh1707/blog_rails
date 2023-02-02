require 'rails_helper'

RSpec.describe 'Users Index', type: :request do
  before(:example) { get users_path }

  it 'response status is corrrect for users#index' do
    expect(response).to have_http_status(200)
  end

  it 'correct template is rendered for users#index' do
    expect(response).to render_template(:index)
  end

  it 'response body has correct text for users#index' do
    expect(response.body).to include('This is the users view')
  end
end
