class HomeController < ApplicationController
  def index
    @latestimage = Image.new("./").latest
  end

  def about
  end
end
