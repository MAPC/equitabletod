class DictionaryEntry < ActiveRecord::Base
  attr_accessible :code, :description, :importance, :interpretation, :name, :order, :technical_notes
end
