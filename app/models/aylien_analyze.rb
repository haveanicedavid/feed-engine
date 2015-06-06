require_relative "../services/aylien_sentiment_service"

class AylienAnalyze
  attr_reader :service
  
  def service
    @service ||= AylienAnalyzer.new
  end
  
  def analyze_tweets(tweets) 
    tweets.map do |tweet|
      a = AnalysisGroup.new
      a.sentiment = service.analyze(tweet)["polarity"]
      a.polarity = service.analyze(tweet)["polarity_confidence"]
      a.subjectivity = service.analyze(tweet)["subjectivity_confidence"]
      a
    end
  end
  
  def grouped_analysis(tweets)
    grouped = analyze_tweets(tweets).group_by { |thing| thing.sentiment }
    grouped.map { | k, v| grouped[k] = [ v.count, (v.reduce(0) { |sum, t| sum + t.polarity }/ v.count) ] }
    grouped
  end    
end

class AnalysisGroup < OpenStruct
  
end