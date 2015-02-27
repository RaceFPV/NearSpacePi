class StreamController < ApplicationController
  def index
    fromfile = Readfile.new('test.txt')
    @lastline = fromfile.tail(1)
  end
end
