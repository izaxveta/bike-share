class Condition < ActiveRecord::Base
  has_many :trips, primary_key: :date, foreign_key: :start_date

  validates_presence_of(
    :date,
    :max_temperature_f,
    :mean_temperature_f,
    :min_temperature_f,
    :mean_humidity,
    :mean_visibility_miles,
    :mean_wind_speed_mph,
    :precipitation_inches
  )




end

=begin
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with a high temperature in 10 degree chunks (e.g. average number of rides on days with high temps between fifty and sixty degrees)

Condition.joins(:trips).group(:max_temperature_f).order("count_id DESC").count(:id).first

SELECT COUNT("conditions"."id") AS count_id, "conditions"."max_temperature_f" AS conditions_max_temperature_f FROM "conditions" INNER JOIN "trips" ON "trips"."start_date" = "conditions"."date" GROUP BY "conditions"."max_temperature_f" ORDER BY count_id DESC



* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with precipitation in half-inch increments.
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean wind speeds in four mile increments.
* Breakout of average number of rides, highest number of rides, and lowest number of rides on days with mean visi
=end
