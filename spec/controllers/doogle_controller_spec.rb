require 'rails_helper'

describe DoogleController do
  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "POST #search" do
  end
end
