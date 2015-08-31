class AppData
  include HTTParty
  base_uri 'https://itunes.apple.com'

  def self.for(*ids)
    response = get('/lookup', {query: {id: ids.join(',') }})
    response_body = JSON.parse(response.body)
    response_body["results"]
  end
end
