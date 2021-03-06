require 'rails_helper'

RSpec.describe Search, type: :model do
  let(:user) { User.create(nickname: "kb", 
                           name: "kristina brown",
                           image_url: "www.examplestuff.com",
                           token: "12345",
                           uid: "12345",
                           location: "Denver",
                           provider: "twitter",
                           email: "example@sample.com",
                           ) }
  let(:search) { Search.create(word: "puppies",
                               active?: true,
                               user_id: user.id
                               )}                         

  it "is valid" do 
    expect(search).to be_valid
  end
end
