class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def index
    	gon.rabl "app/views/search/names.json.rabl", as: "lables"
    	gon.rabl "app/views/search/munis.json.rabl", as: "munis"
    end
  
end
