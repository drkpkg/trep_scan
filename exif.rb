require 'mini_magick'
require 'exiftool'

class EfixCheck

  def run data_seed
    File.readlines(data_seed).each do |line|
       read_file"#{line.strip}"
    end
  end

  def check_metadata(data)
    #ExifTool.command = '/usr/bin/exiftool'
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

  def read_file(data)
    begin
      if File.exist?("#{data}1.jpg")
        check_metadata "#{data}1.jpg"
      end
    rescue StandardError => e
      p "Cause: #{e.inspect}"
    end
  end
end

exif = EfixCheck.new
exif.run "mesas"