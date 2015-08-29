class AppData
  include HTTParty
  base_uri 'https://itunes.apple.com'

  attr_accessor :app_id, :metadata

  def initialize(app_id)
    self.app_id = app_id
    self.metadata = fetch_metadata
  end

  def track_id
    metadata["trackId"]
  end

  def app_name
    metadata["trackName"]
  end

  def description
    metadata["description"]
  end

  def small_icon_url
    metadata["artworkUrl60"]
  end

  def publisher_name
    metadata["sellerName"]
  end

  def price
    metadata["price"]
  end

  def version_number
    metadata["version"]
  end

  def average_user_rating
    metadata["averageUserRating"]
  end

  private
  def fetch_metadata
    response = self.class.get('/lookup', {query: {id: app_id }})
    response_body = JSON.parse(response.body)
    response_body["results"][0]
  end
end
