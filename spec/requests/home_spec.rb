require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    before do
      get "/home/index"
    end

    it "works! 200 OK" do
        expect(response).to have_http_status(200)
    end

    it "returns message" do
      expect(response.body).to eq 'Fullstack Challenge 20201026'
    end
  end
end