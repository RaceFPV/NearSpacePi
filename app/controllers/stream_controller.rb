class StreamController < ApplicationController
  def index
    gyrofile = Tail.new('./streamed_data/gyro.txt').tail(1).flatten
    @gyrotime = gyrofile.first
    @gyrodata = gyrofile.second
    unless @gyrodata.present? then @gyrodata = "N/A" end
    humidityfile = Tail.new('./streamed_data/humidity.txt').tail(1).flatten
    @humiditytime = humidityfile.first
    unless @humiditydata.present? then @humiditydata = "N/A N/A" end
    @humiditydata = humidityfile.second.split(' ')
    @humiditytemp = @humiditydata.first.gsub('Temp=', '').gsub('*',' ')
    @humidity = @humiditydata.second.gsub('Humidity=', '')
    externalfile = Tail.new('./streamed_data/external.txt').tail(1).flatten
    @externaltime = externalfile.first
    @externaldata = externalfile.second.gsub('(','').gsub(')','')
    unless @externaldata.present? then @externaldata = "N/A" end
  end

  def show
    send_file File.join('./streamed_images/',params[:name] + '.png'), :disposition => 'inline'
  end
end
