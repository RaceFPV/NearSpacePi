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