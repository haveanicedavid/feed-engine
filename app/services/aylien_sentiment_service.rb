require 'net/http'
require 'uri'
require 'json'

class AylienSentimentService
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
  end
end

