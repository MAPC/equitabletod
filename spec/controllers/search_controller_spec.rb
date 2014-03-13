require 'spec_helper'

describe SearchController do

  describe "GET 'search'" do
    it "returns http success" do
      get 'search'
      response.should be_success
    end
  end

  describe "GET 'suggest'" do
    it "returns http success" do
      get 'suggest'
      response.should be_success
    end
  end

end
