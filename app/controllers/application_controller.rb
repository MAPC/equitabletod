class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def index
    	gon.rabl "app/views/search/index.json.rabl", as: "munis"
    end
  
end
