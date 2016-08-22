class HomeController < ApplicationController
  def index
  	@summaries = Summary.all
  end
end
