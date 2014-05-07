class ApplicationController < ActionController::Base
  protect_from_forgery
  
    def index
    	gon.rabl "app/views/search/names.json.rabl", as: "names"
    	gon.rabl "app/views/search/muni_names.json.rabl", as: "muni_names"
    end
  
end
