class Itunes
  include HTTParty
  attr_accessor :category_id, :monetization

  base_uri 'https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop'

  def initialize(opts = {})
    @category_id  = opts[:category_id]
    @monetization = opts[:monetization]
  end

  def query
    @query ||= { genreId: @category_id, popId: 30, dataOnly: true, l: 'en'}
  end

  def top_apps
  end
end