require "rails_helper"

RSpec.describe TwittersearchService do
  describe "tweets" do
    it "returns tweets" do
      VCR.use_cassette("tweets") do
        tweets = TwittersearchService.new.search_by("puppies")
        expect(tweets.first.attrs[:user][:screen_name]).to eq("MacKaylaanne_")
      end
    end
    
    it "can be properly parsed" do
      VCR.use_cassette("tweets") do
        tweets = SearchResults.new("puppies").all_tweets
        expect(tweets.first.screen_name).to eq("MacKaylaanne_")
      end
    end
    
    it "can be analyzed" do
      VCR.use_cassette("tweets") do
        t = []
        tweet_text = SearchResults.new("puppies").all_tweets.first.text
        t << tweet_text
        VCR.use_cassette("analyze") do
          a = AylienAnalyze.new.grouped_analysis(t)
          expect(a.first.first).to eq("positive")
        end
      end
    end
  end
end