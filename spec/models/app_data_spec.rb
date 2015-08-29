require 'rails_helper'

RSpec.describe 'AppData', :type => :model do
  let(:uber_id) { 368677368 }

  let(:uber_metadata) {
    { "screenshotUrls"=>
        ["http://a2.mzstatic.com/us/r30/Purple7/v4/48/4a/32/484a3275-f988-b55a-907b-52d086fd47cd/screen1136x1136.jpeg", 
         "http://a5.mzstatic.com/us/r30/Purple7/v4/89/85/f4/8985f44b-2710-e74a-1ba8-1b2e933b1ae4/screen1136x1136.jpeg", 
         "http://a2.mzstatic.com/us/r30/Purple1/v4/17/0b/a1/170ba158-0e6a-fdc3-bf6b-6b54d543b18b/screen1136x1136.jpeg", 
         "http://a3.mzstatic.com/us/r30/Purple7/v4/5b/23/ee/5b23ee08-9ff2-6aa3-1a85-1a95eb7948d3/screen1136x1136.jpeg", 
         "http://a5.mzstatic.com/us/r30/Purple1/v4/e0/fc/9e/e0fc9eba-6035-8885-1963-fab370398402/screen1136x1136.jpeg"], 
      "ipadScreenshotUrls" => [], 
      "artworkUrl60" => "http://is4.mzstatic.com/image/thumb/Purple1/v4/e7/03/c0/e703c013-76b3-4fdb-eeee-838dc075fbd2/Icon.png/0x0ss-85.jpg", 
      "artworkUrl512" => "http://is3.mzstatic.com/image/thumb/Purple4/v4/47/52/9b/47529b8d-5384-846f-4db1-ba9e8f09ba1a/mzl.apoutcfl.png/0x0ss-85.jpg", 
      "artistViewUrl" => "https://itunes.apple.com/us/developer/uber-technologies-inc./id368677371?uo=4", 
      "kind" => "software", 
      "features" => [], 
      "supportedDevices" => ["iPodTouchSixthGen", "iPhone5s", "iPhone5c", "iPad23G", "iPhone5", "iPadThirdGen", "iPadThirdGen4G", "iPad2Wifi", "iPhone6Plus", "iPadFourthGen4G", "iPodTouchFifthGen", "iPadMini4G", "iPadMini", "iPadFourthGen", "iPhone4", "iPhone6", "iPhone4S"], 
      "advisories" => [], 
      "isGameCenterEnabled" => false, 
      "userRatingCountForCurrentVersion" => 122, 
      "trackViewUrl" => "https://itunes.apple.com/us/app/uber/id368677368?mt=8&uo=4", 
      "averageUserRatingForCurrentVersion" => 4.0, 
      "trackCensoredName" => "Uber", 
      "languageCodesISO2A" => ["AR", "AZ", "NB", "BG", "HR", "CS", "DA", "NL", "EN", "ET", "FI", "FR", "DE", "EL", "HE", "HU", "ID", "IT", "JA", "KO", "LV", "LT", "MS", "PL", "PT", "RO", "RU", "ZH", "SK", "SL", "ES", "SV", "TH", "ZH", "TR", "VI"], 
      "fileSizeBytes" => "51924235", 
      "sellerUrl" => "https://uber.com", 
      "contentAdvisoryRating" => "4+", 
      "artworkUrl100" => "http://is3.mzstatic.com/image/thumb/Purple4/v4/47/52/9b/47529b8d-5384-846f-4db1-ba9e8f09ba1a/mzl.apoutcfl.png/0x0ss-85.jpg", 
      "trackContentRating" => "4+", 
      "currency" => "USD", 
      "wrapperType" => "software", 
      "version" => "2.92.1", 
      "artistId" => 368677371, 
      "artistName" => "Uber Technologies, Inc.", 
      "genres" => ["Travel", "Lifestyle"], 
      "price" => 0.0, 
      "description" => "Uber is your private driver in more than 50 countries.\n\n- Request a ride using the app and get picked up within minutes. On-demand service means no reservations required and no waiting in taxi lines.\n\n- Compare rates for different vehicles and get fare quotes in the app. Use PayPal or add a credit card to your secure account so you never need cash on hand.\n\n- Set your pickup location and final destination for an easy trip. Get connected to your personal driver and check the progress of your Uber at any time.\n\n- Sit back, relax, and go anywhere you want. We'll email you a receipt when you arrive at your destination.\n\nAn entirely new and modern way to travel is at your fingertips.", 
      "trackId" => 368677368, 
      "trackName" => "Uber", 
      "genreIds" => ["6003", "6012"], 
      "releaseDate" => "2010-05-21T03:11:23Z", 
      "sellerName" => "Uber Technologies, Inc.", 
      "bundleId" => "com.ubercab.UberClient", 
      "releaseNotes" => "We’ve made design and localization updates to improve the Uber experience around the globe.\n\n** Uber saves time by connecting you to a driver as quickly as possible. If you like the service, please consider using those extra few minutes to review our app. **",
      "primaryGenreName" => "Travel",
      "primaryGenreId" => 6003,
      "isVppDeviceBasedLicensingEnabled" => true,
      "formattedPrice" => "Free",
      "minimumOsVersion" => "7.0",
      "averageUserRating" => 4.0, 
      "userRatingCount" => 20302
    }
  }
  describe 'initialize' do
    it 'must fetch metadata information' do
      VCR.use_cassette 'uber_metadata' do
        app_data = AppData.new(uber_id)
        expect(app_data.track_id).to eql uber_id
        expect(app_data.metadata).to eql uber_metadata
      end
    end
  end
end