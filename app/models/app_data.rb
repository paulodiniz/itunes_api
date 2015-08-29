class AppData
  include HTTParty
  base_uri 'https://itunes.apple.com'

  attr_accessor :app_id, :metadata

  def initialize(app_id)
    self.app_id = app_id
    self.metadata = fetch_metadata
  end

  private
  def fetch_metadata
    response = self.class.get('/lookup', {query: {id: app_id }})
    response_body = JSON.parse(response.body)
    response_body["results"][0].slice("trackName",
                "description",
                "artworkUrl60",
                "sellerName",
                "price",  
                "version",
                "averageUserRating")
  end
end
