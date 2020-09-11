class SearchController < ApplicationController
  def index
    author = params['author']
    @poems = PoemSearchFacade.new(author).poems
  end
end 