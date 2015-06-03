require "rails_helper"

RSpec.describe "user can create search", type: :feature do 

  let(:user) { User.create(nickname: "dave",
                           name: "dave",
                           token: "12345", 
                           uid: "321",
                           location: "Denver, CO",
                           provider: "twitter")}
                           
  it "enter a search and see results" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit user_path(user)
    
    fill_in "search[word]", with: "puppies"
    click_button "Submit"
    
    expect(page).to have_content("puppies")
  end  
end