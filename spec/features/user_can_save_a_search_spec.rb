require "rails_helper"

RSpec.describe "user can create search", type: :feature do 

  let(:user) { User.create(nickname: "dave",
                           name: "dave",
                           token: "12345", 
                           uid: "321",
                           location: "Denver, CO",
                           provider: "twitter")}
                           
  it "can save a search" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit "/searches"
    
    fill_in "user[email]", with: "dave@dave.com"
    click_button "Update Email"
    
    visit "/searches"

    fill_in "search[word]", with: "bluebottlecoffee"
    click_button "Save Search"
    
    expect(page).to have_content("Saved Searches")
    expect(page).to have_content("bluebottlecoffee")
  end
  
  it "can make a search inactive" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/searches"
    
    fill_in "user[email]", with: "dave@dave.com"
    click_button "Update Email"
    
    visit "/searches"
    
    fill_in "search[word]", with: "bluebottlecoffee"
    click_button "Save Search"
    
    expect(page).to have_content("bluebottlecoffee")
    
    click_link "Remove"

    expect(page).to have_content("Your search for bluebottlecoffee has been deactivated.")
  end
end