class ToneService
  def tone(text)
    value = get_json("/v3/tone?version=2017-09-21&text=#{text}")
    value[:document_tone][:tones].first[:tone_name]
  end
  
  private

  def get_json(url = nil)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def conn
    Faraday.new("https://api.us-south.tone-analyzer.watson.cloud.ibm.com/instances/6bd3f4b9-e74a-4a71-b9ae-f506c0e84e46") do |faraday|
      faraday.basic_auth('apikey', ENV['IBM_KEY'])
    end
  end
end 