require 'rails_helper'

RSpec.describe 'AppData', :type => :model do
  let(:uber_id) { 368677368 }

  describe 'initialize' do

    it 'must fetch metadata information' do
      VCR.use_cassette 'uber_metadata' do
        app_data = AppData.new(uber_id)
        expect(app_data.track_id).to eql uber_id
        expect(app_data.app_name).to eql "Uber"
        expect(app_data.description).to include("Uber is your private driver in more than 50")
        expect(app_data.small_icon_url).to eql "http://is4.mzstatic.com/image/thumb/Purple1/v4/e7/03/c0/e703c013-76b3-4fdb-eeee-838dc075fbd2/Icon.png/0x0ss-85.jpg"
        expect(app_data.publisher_name).to eql "Uber Technologies, Inc."
        expect(app_data.price).to eql 0.0
        expect(app_data.version_number).to eql "2.92.1"
        expect(app_data.average_user_rating).to eql 4.0
      end
    end
  end
end