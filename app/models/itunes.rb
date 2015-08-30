class Itunes
  include HTTParty
  attr_accessor :category_id, :monetization

  base_uri 'https://itunes.apple.com'

  def initialize(opts = {})
    @category_id  = opts[:category_id]
    @monetization = opts[:monetization]
  end

  def query
    @query ||= { genreId: @category_id, popId: 30, dataOnly: true, l: 'en'}
  end

  def headers
    @headers ||=
      {
        "Accept-Encoding"     => 'gzip, deflate, sdch',
        "Accept-Language"     => 'en-US,en;q=0.8,lv;q=0.6',
        "User-Agent"          => 'iTunes/11.1.1 (Windows; Microsoft Windows 7 x64 Ultimate Edition Service Pack 1 (Build 7601)) AppleWebKit/536.30.1',
        "Accept"              => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8',
        "Cache-Control"       => 'max-age=0',
        "X-Apple-Store-Front" => '143441-1,17'
      }
  end

  def options
    @options ||= { query: query, headers: headers }
  end

  def top_apps
    return cache_value if cache_value
    result = top_apps_ids.map { |app_id| AppData.for(app_id) }
    Rails.cache.write(cache_key, result)
    return result
  end

  def on_rank(rank = 1)
    app = top_apps_ids[rank - 1]
    return AppData.for(app)
  end


  def top_publishers
    top_publishers_count.map do |artist_id, number_of_apps|
      AppData.for(artist_id).merge("numberOfApps" => number_of_apps)
    end
  end

  def top_publishers_count
    publishers_count = {}
    top_apps.each do |app|
      artist_id = app["artistId"]
      publishers_count[artist_id] = 0 if publishers_count[artist_id].nil?
      publishers_count[artist_id] += 1
    end
    publishers_count.sort_by { |k,v| v}.reverse
  end

  private

  def cache_key
    "top-#{@category_id}-#{@monetization}"
  end

  def cache_value
    Rails.cache.read(cache_key)
  end

  def top_apps_ids
    itunes_response["topCharts"][monetization_id]["adamIds"]
  end

  def itunes_response
    self.class.get('/WebObjects/MZStore.woa/wa/viewTop', options)
  end

  def monetization_id
    case @monetization
    when :paid
      0
    when :free
      1
    when :grossing
      2
    end
  end
end