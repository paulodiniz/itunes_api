require 'rails_helper'

RSpec.describe 'AppData', :type => :model do
  let(:uber_id) { 368677368 }

  describe 'initialize' do

    it 'must fetch metadata information' do
      VCR.use_cassette 'uber_metadata' do
        app_data = AppData.new(uber_id)
        expect(app_data.metadata).to eql({
          "trackName"         => "Uber",
          "description"       => "Uber is your private driver in more than 50 countries.\n\n- Request a ride using the app and get picked up within minutes. On-demand service means no reservations required and no waiting in taxi lines.\n\n- Compare rates for different vehicles and get fare quotes in the app. Use PayPal or add a credit card to your secure account so you never need cash on hand.\n\n- Set your pickup location and final destination for an easy trip. Get connected to your personal driver and check the progress of your Uber at any time.\n\n- Sit back, relax, and go anywhere you want. We'll email you a receipt when you arrive at your destination.\n\nAn entirely new and modern way to travel is at your fingertips.",
          "artworkUrl60"      => "http://is4.mzstatic.com/image/thumb/Purple1/v4/e7/03/c0/e703c013-76b3-4fdb-eeee-838dc075fbd2/Icon.png/0x0ss-85.jpg",
          "sellerName"        => "Uber Technologies, Inc.",
          "price"             => 0.0,
          "version"           => "2.92.1",
          "averageUserRating" => 4.0
        })
      end
    end
  end
end