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
    CSV.open('./db/csv/condition2.csv', "wb") do |write_file|
      CSV.foreach('./db/csv/condition.csv', options) do |source_row|
        source_row.delete(:max_dew_point_f)
        source_row.delete(:mean_dew_point_f)
        source_row.delete(:min_dew_point_f)
        source_row.delete(:max_humidity)
        source_row.delete(:min_humidity)
        source_row.delete(:max_sea_level_pressure_inches)
        source_row.delete(:mean_sea_level_pressure_inches)
        source_row.delete(:min_sea_level_pressure_inches)
        source_row.delete(:max_visibility_miles)
        source_row.delete(:min_visibility_miles)
        source_row.delete(:max_wind_speed_mph)
        source_row.delete(:max_gust_speed_mph)
        source_row.delete(:cloud_cover)
        source_row.delete(:events)
        source_row.delete(:wind_dir_degrees)
        check_insert(source_row, write_file)
      end
    end
  end
  def check_insert(row, write_file)
    if @zip == row[:zip_code]
      write_file << row
    elsif @zip.nil?
      @zip = row[:zip_code]
      write_file << row
    end
  end
end

CSVTruncater.new.truncate
