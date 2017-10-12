require 'csv'
require './app/models/station'
require './app/models/trip'
require './app/models/condition'


class Seed
  class << self

    def start
      seed_stations
      seed_trips
      seed_conditions
    end

    def seed_stations
      CSV.foreach(csv_file('station'), options) do |row|
        next if Station.exists?(row[:id])
        convert_date(row, :installation_date)
        Station.create!(row.to_hash)
      end
    end

    def seed_trips

      CSV.foreach(csv_file('trip'), options) do |row|
      # require "pry";binding.pry
        return if Trip.exists?(row[:id])
        return unless Station.exists?(row[:start_station_id])
        return unless Station.exists?(row[:end_station_id])
        convert_date(row, :start_date)
        convert_date(row, :end_date)
        row.delete(:start_station_name)
        row.delete(:end_station_name)
        Trip.create!(row.to_hash)
      end
    end

    def seed_conditions
      CSV.foreach(csv_file('condition'), options) do |row|
        next if Condition.exists?(row[:id])
        convert_date(row, :date)
        row.delete(:max_dew_point_f)
        row.delete(:mean_dew_point_f)
        row.delete(:min_dew_point_f)
        row.delete(:max_humidity)
        row.delete(:min_humidity)
        row.delete(:max_sea_level_pressure_inches)
        row.delete(:mean_sea_level_pressure_inches)
        row.delete(:min_sea_level_pressure_inches)
        row.delete(:max_visibility_miles)
        row.delete(:min_visibility_miles)
        row.delete(:max_wind_speed_mph)
        row.delete(:max_gust_speed_mph)
        row.delete(:cloud_cover)
        row.delete(:events)
        row.delete(:wind_dir_degrees)
        row.delete(:zip_code)
        Condition.create(row.to_hash)
      end
    end

    def convert_date(row, field)
      m, d, y = row[field].split('/')
      row[field] = [d, m, y].join('/')
    end

    def csv_file(table)
      file = './db/csv/'
      file += 'fixtures/' if testing?
      file += "#{table}.csv"
    end

    def options
      {
        headers: true,
        header_converters: :symbol,
        converters: :numeric
      }
    end

    def testing?
      ENV["RACK_ENV"] == "test"
    end

  end

end
