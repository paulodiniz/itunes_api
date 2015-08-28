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
    self.class.get('/WebObjects/MZStore.woa/wa/viewTop', options)["topCharts"][monetization_id]["adamIds"]
  end

  private
  def monetization_id
    case @monetization
    when :paid
      0
    when :free
      1
    end
  end
end