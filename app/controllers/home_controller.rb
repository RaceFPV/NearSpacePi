class HomeController < ApplicationController
  def index
    @latestimage = Image.new("./streamed_images/").latest.flatten
    #for gyro cube
      gyrofile = Tail.new('./streamed_data/gyro.txt').tail(1).flatten
      @gyrotime = gyrofile.first
      @gyrodata = gyrofile.second.gsub('euler','')[3..-1].chomp.split('   ')
      unless @gyrodata.present? then @gyrodata = "N/A" end
    #end gyro cube
  end

  def about
  end
end
