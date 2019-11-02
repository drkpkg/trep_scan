require 'mini_magick'
require 'exiftool'

class EfixCheck

  def run(data_seed, folder = './')
    File.readlines(data_seed).each do |line|
      read_file "#{line.strip}", folder
    end
  end

  def check_metadata(data)
    p "Leyendo acta #{data}"
    e = Exiftool.new data
    data_hash = e.to_hash
    if data_hash[:date_time_original]
      date_time_original = Date.strptime(data_hash[:date_time_original], '%Y:%m:%d %H:%M:%S')
      date_time_trep = Date.strptime("2019:10:20 16:00:00", '%Y:%m:%d %H:%M:%S')
      if date_time_original < date_time_trep
        p "#{data} ==> #{date_time_original.to_datetime}"
      end
    end
  end

  def read_file(data, folder='./')
    begin
      path = "#{path}#{data}1.jpg"
      if File.exist?(path)
        check_metadata "#{data}1.jpg"
      end
    rescue StandardError => e
      p "Cause: #{e.inspect}"
    end
  end
end

exif = EfixCheck.new
exif.run ARGV[0], ARGV[1]
