class AppData
  include HTTParty
  base_uri 'https://itunes.apple.com'

  class << self
    def for(app_id)
      response = get('/lookup', {query: {id: app_id }})
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

end
