require 'rails_helper'

RSpec.describe CategoriesController, :type => :controller do
  describe '#top' do

    describe 'for paid apps' do

      it 'must return the top 200 paid apps on a category' do
        VCR.use_cassette 'top_paid_6001' do
          get :top, id:6001, monetization: 'paid' 
          json_response = JSON.parse(response.body)
          expect(json_response.count).to eql 200
          expect(json_response[0]["sellerName"]).to eql "IAC Search & Media Europe Ltd."
        end
      end

    end
  end
end
