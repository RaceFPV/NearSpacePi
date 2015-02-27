#Base class for all the scraping class
class Readfile
  attr_accessor :location

  def initialize(location)
    @location = location
  end
end
  #read last n lines of a file
class Tail < Readfile
  def tail(lines)
    path = @location
    n = lines
    file = File.open(path, "r")
    buffer_s = 512
    line_count = 0
    file.seek(0, IO::SEEK_END)

    offset = file.pos # we start at the end

    while line_count <= n && offset > 0
      to_read = if (offset - buffer_s) < 0
                  offset
                else
                  buffer_s
                end

      file.seek(offset-to_read)
      data = file.read(to_read)

      data.reverse.each_char do |c|
        if line_count > n
          offset += 1
          break
        end
        offset -= 1
        if c == "\n"
          line_count += 1
        end
      end
    end

    file.seek(offset)
    data = file.read
    return {file.mtime => data}
  end
end

#get an image file
class Image < Readfile
  def image()
    path = @location
    file = File.open(path, "r")
    image = file.read
    return {file.mtime => image}
  end

  def latest()
    dir = @location
    files = Dir.glob(dir+"*.{png}").collect { |file| file }.sort { |file2,file1| File.mtime(dir+file1) <=> File.mtime(dir+file2) }
    unless files.first.present? then return {Time.now => "N/A"} end
    latest = files.first.gsub(dir, '')
    return {File.open(dir+latest, "r").mtime => latest}
  end
end