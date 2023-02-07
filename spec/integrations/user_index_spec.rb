require 'rails_helper'

RSpec.describe 'User index integration tests', type: :system do
  describe 'index page' do
    it 'I can see the username of all other users.' do
      visit users_path
      puts users_path
      expect(page).to have_content('Tom')
      expect(page).to have_content('Lilly')
    end
    # it 'I can see the profile picture for each user.' do
    #   visit hello_world_index_path
    #   expect(page).to have_content('Hello, world!')
    # end
    # it 'I can see the number of posts each user has written.' do
    #   visit hello_world_index_path
    #   expect(page).to have_content('Hello, world!')
    # end
    # it 'When I click on a user, I am redirected to that user\'s show page.' do
    #   visit hello_world_index_path
    #   expect(page).to have_content('Hello, world!')
    # end
  end
end