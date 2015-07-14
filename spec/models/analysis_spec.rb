require 'rails_helper'

RSpec.describe Analysis, type: :model do
  let(:user) { User.create(nickname: "kb", 
                           name: "kristina brown",
                           image_url: "www.examplestuff.com",
                           token: "12345",
                           uid: "12345",
                           location: "Denver",
                           provider: "twitter",
                           email: "example@sample.com",
                           ) }
  let(:analysis) { Analysis.create(keyword: "puppies",
                                   analysis: {thing: "this", that: "thing"},
                                   user_id: user.id
                                  )}                         

  it "is valid" do 
    expect(analysis).to be_valid
  end
end
