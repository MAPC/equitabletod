class DictionaryEntriesController < ApplicationController
  
  has_scope :by_name

  def index
    @entries = apply_scopes(DictionaryEntry).all
  end

  def show
    @entry = DictionaryEntry.find(params[:id])
  end
end
