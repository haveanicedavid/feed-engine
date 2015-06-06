require 'net/http'
require 'uri'
require 'json'

class AylienAnalyzer

    def call_api(endpoint, parameters)
      url = URI.parse("https://api.aylien.com/api/v1/#{endpoint}")
      headers = {
        "Accept"                           =>   "application/json",
        "X-AYLIEN-TextAPI-Application-ID"  =>   ENV["AYLIEN_APPLICATION_ID"],
        "X-AYLIEN-TextAPI-Application-Key" =>   ENV["AYLIEN_APPLICATION_KEY"]
      }

      http         = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      request      = Net::HTTP::Post.new(url.request_uri)
      request.initialize_http_header(headers)
      request.set_form_data(parameters)

      response = http.request(request)

      JSON.parse response.body
    end

    def analyze(tweet)
      parameters = {"text" => tweet }

      call_api("sentiment", parameters)

      # puts "Sentiment: #{sentiment["polarity"]} (#{sentiment["polarity_confidence"]})"
      # puts "Language: #{language["lang"]} (#{language["confidence"]})"
    end

  # parameters = {"text" => "John is a very good football player?"}
  # parameters = {"text" => "John"}

  # sentiment = call_api("sentiment", parameters)
  # language = call_api("language", parameters)

  # puts "Sentiment: #{sentiment["polarity"]} (#{sentiment["polarity_confidence"]})"
  # puts "Language: #{language["lang"]} (#{language["confidence"]})"
end

