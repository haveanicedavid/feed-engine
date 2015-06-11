require "rails_helper"

RSpec.describe "user can do a quick search", type: :feature do 

  let(:user) { User.create(nickname: "dave",
                           name: "dave",
                           token: "12345", 
                           uid: "321",
                           email: "example@example.org",
                           location: "Denver, CO",
                           provider: "twitter")}
                           
  it "can quick search" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    VCR.use_cassette("tweets") do
      visit "/users/#{user.id}"

      fill_in "search", with: "puppies"
      click_button "Submit"
      
      expect(page).to have_content(" ")
    end
  end
end