class AppData
  include HTTParty
  base_uri 'https://itunes.apple.com'

  def self.for(app_id)
    response = get('/lookup', {query: {id: app_id }})
    response_body = JSON.parse(response.body)
    response_body["results"][0]
  end
end
