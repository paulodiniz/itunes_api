require 'rails_helper'

RSpec.describe 'Itunes', :type => :model do

  it { expect(Itunes.base_uri).to eql 'https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop'}

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

  describe '#top_apps' do
    it 'must return ' do
    end
  end
end