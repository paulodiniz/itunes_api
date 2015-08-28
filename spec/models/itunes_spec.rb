require 'rails_helper'

RSpec.describe 'Itunes', :type => :model do

  it { expect(Itunes.base_uri).to eql 'https://itunes.apple.com'}

  describe '#initialize' do
    it 'must take category an monetization' do
      itunes = Itunes.new(category_id: 6002, monetization: :free)
      expect(itunes.category_id).to eql 6002
      expect(itunes.monetization).to eql :free
    end
  end

  describe '#query' do
    it 'must return a hash with the correct params' do
      itunes = Itunes.new(category_id: 6003, monetization: :wtv)
      expect(itunes.query).to eql({ genreId: 6003, popId: 30, dataOnly: true, l: 'en' })
    end
  end

  describe '#headers' do
    it 'must return a hash with the correct headers' do
      itunes = Itunes.new(category_id: 6003, monetization: :wtv)
      headers = itunes.headers

      expect(headers["Accept-Encoding"]).to eql('gzip, deflate, sdch')
      expect(headers["Accept-Language"]).to eql('en-US,en;q=0.8,lv;q=0.6')
      expect(headers["User-Agent"]).to eql('iTunes/11.1.1 (Windows; Microsoft Windows 7 x64 Ultimate Edition Service Pack 1 (Build 7601)) AppleWebKit/536.30.1')
      expect(headers["Accept"]).to eql('text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8')
      expect(headers["Cache-Control"]).to eql('max-age=0')
      expect(headers["X-Apple-Store-Front"]).to eql('143441-1,17')
    end
  end

  describe '#top_apps' do

    it 'must return ' do
      VCR.use_cassette 'top_6002' do
        itunes = Itunes.new(category_id: 6003, monetization: :paid)
        paid_apps_ids = itunes.top_apps
        expect(paid_apps_ids.first).to eql  "382069612"
        expect(paid_apps_ids.second).to eql "545498325"
        expect(paid_apps_ids.last).to eql   "933640114"
      end
    end
  end
end