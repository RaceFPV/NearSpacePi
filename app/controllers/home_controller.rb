class HomeController < ApplicationController
  def index
    @latestimage = Image.new("./streamed_images/").latest.flatten
  end

  def about
  end
end
