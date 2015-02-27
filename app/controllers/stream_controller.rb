class StreamController < ApplicationController
  def index
    fromfile = Tail.new('test.txt')
    @lastline = fromfile.tail(1)
  end
end
