
require 'csv'

class CSVTruncater
  def initialize
    @zip = nil
  end
  def options
    {
      headers: true,
      header_converters: :symbol
    }
  end

  def truncate
    CSV.open('./db/csv/trip2.csv', "wb") do |write_file|
      CSV.foreach('./db/csv/trip.csv', options) do |source_row|
        row.delete(:start_station_name)
        row.delete(:end_station_name)
        check_trip_insert(source_row, write_file)
      end
    end
  end


  # def truncate_trip
  #   truncate('./db/csv/trip.csv', './db/csv/trip_short.csv') do |write_file, source_row|
  #     row.delete(:start_station_name)
  #     row.delete(:end_station_name)
  #     check_trip_insert(source_row, write_file)
  #   end
  # end
  #
  # def truncate(source_filename, write_filename)
  #   CSV.open(write_filename, "wb") do |write_file|
  #     CSV.foreach(source_filename, options) do |source_row|
  #       yield(write_file, source_row)
  #     end
  #   end
  # end


  def check_trip_insert(row, write_file)
    @count ||= 0
    if @count == 1000
      write_file << row
      @count = 0
    elsif
      @count += 1
    end
  end

end

CSVTruncater.new.truncate
