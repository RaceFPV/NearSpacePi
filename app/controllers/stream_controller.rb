class StreamController < ApplicationController
  def index
    testfile = Tail.new('test.txt').tail(1).flatten
    @testfiletime = testfile.first
    @testfiledata = testfile.second
    unless @testfiledata.present? then @telemetrydata = "N/A" end
    telemetryfile = Tail.new('../telemetry.txt').tail(1).flatten
    @telemetrytime = telemetryfile.first
    @telemetrydata = telemetryfile.second
    unless @telemetrydata.present? then @telemetrydata = "N/A" end
  end

  def show
    send_file File.join('./streamed_images/',params[:name] + '.png'), :disposition => 'inline'
  end
end
