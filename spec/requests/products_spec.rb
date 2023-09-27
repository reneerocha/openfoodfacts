require 'rails_helper'

RSpec.describe "Products", type: :request do
  describe "GET /products" do
    let!(:products) { create_list(:product, 100) }

    before do
      get "/products"
    end

    it "correct total products" do
      expect(Product.count).to eq(100)
    end 

    it "contain keys json Product" do
      expect(response.body).to include('code','barcode','status','imported_t','url','product_name','quantity','categories','packaging','brands','image_url')
    end

    it "works! 200 OK" do
      expect(response).to have_http_status(200)
    end

    it "index not empty" do
      expect(response.body).not_to be_empty
    end

    it "find by code" do
      get "/products/#{Product.last.code}"
      expect(response.body).not_to be_empty
    end

    it 'returns page 2' do
      get "/products/?page=2"
      expect(response).to have_http_status(200)
    end

  end

end
