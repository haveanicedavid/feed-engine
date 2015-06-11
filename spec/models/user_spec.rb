require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(nickname: "kb", 
                           name: "kristina brown",
                           image_url: "www.examplestuff.com",
                           token: "12345",
                           uid: "12345",
                           location: "Denver",
                           provider: "twitter",
                           email: "example@sample.com",
                           ) }

  it "is valid" do 
    expect(user).to be_valid
  end
  
  it "knows if there is no email" do 
    expect(user.email?).to eq(true)
    user.update(email: nil)
    
    expect(user.email?).to eq(false)
  end
end
