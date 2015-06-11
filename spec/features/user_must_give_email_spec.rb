require 'rails_helper'

RSpec.describe 'user' do
  context 'without an email address' do
    let(:user) { User.create(nickname: "dave",
                             name: "dave",
                             token: "12345",
                             uid: "321",
                             location: "Denver, CO",
                             provider: "twitter")}
    it 'is redirected to email update' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      expect(page).to have_content("Please enter your email information")
    end
    
    it 'can enter email' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit user_path(user)
      
      fill_in "user[email]", with: "dave@dave.com"
      click_button "Update Email"
      
      expect(current_path).to eq("/users/#{user.id}")
    end
  end
end
