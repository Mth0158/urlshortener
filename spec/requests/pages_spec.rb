require 'rails_helper'

RSpec.describe "Pages", type: :request do

  describe "GET /" do
    it "returns http success" do
      get "/"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /home" do
    it "returns http success" do
      get "/home"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /newurl" do
    it "returns http success" do
      get "/newurl"
      expect(response).to have_http_status(:success)
    end
  end

end
